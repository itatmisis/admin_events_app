import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';
part 'scanner_bloc.freezed.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final QRRepository qrRepository;
  final GuestRepository guestRepository;

  ScannerBloc(this.qrRepository, this.guestRepository) : super(const ScannerState()) {
    on<_SubscriptionRequested>((event, emit) async {
      await emit.forEach(
          qrRepository.getQrResult(),
          onData: (qrData) => state.copyWith(qrData: qrData));
    });

    on<_OpenRequested>((event, emit) {
      emit(state.copyWith(scannerOpened: true));
    });

    on<_CloseRequested>((event, emit) {
      emit(state.copyWith(scannerOpened: false, failure: false));
    });

    on<_InitializedFailed>((event, emit) {
      emit(state.copyWith(failure: true));
    });

    on<_Scanned>((event, emit) async {
      await qrRepository.checkQR(event.data);
    });

    on<_GuestApproved>((event, emit) async {
      if (state.qrData is QRDataValid) {
        var guest = (state.qrData as QRDataValid).guest;
        await guestRepository.accept(guest);
        emit(const ScannerState().copyWith(scannerOpened: true));
      }
    });

    on<_GuestRejected>((event, emit) async {
      if (state.qrData is QRDataValid) {
        var guest = (state.qrData as QRDataValid).guest;
        await guestRepository.decline(guest);
        emit(const ScannerState().copyWith(scannerOpened: true));
      }
    });

    on<_InvalidGuestRejected>((event, emit) {
      emit(const ScannerState().copyWith(scannerOpened: true));
    });
  }
}
