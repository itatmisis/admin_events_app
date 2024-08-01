part of 'scanner_bloc.dart';

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState({
    @Default(false) bool scannerOpened,
    @Default(false) bool failure,
    @Default('') String scannedData,
    @Default(QRDataInitial()) QRData qrData
  }) = _ScannerState;
}
