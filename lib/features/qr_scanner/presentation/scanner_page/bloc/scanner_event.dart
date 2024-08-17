part of 'scanner_bloc.dart';

@freezed
class ScannerEvent with _$ScannerEvent {
  const factory ScannerEvent.subscriptionRequested({required String eventId}) = _SubscriptionRequested;
  const factory ScannerEvent.openRequested() = _OpenRequested;
  const factory ScannerEvent.closeRequested() = _CloseRequested;
  const factory ScannerEvent.initializedFailed() = _InitializedFailed;
  const factory ScannerEvent.scanned({required String data}) = _Scanned;
  const factory ScannerEvent.invalidGuestRejected() = _InvalidGuestRejected;
  const factory ScannerEvent.guestApproved() = _GuestApproved;
  const factory ScannerEvent.guestRejected() = _GuestRejected;
}