import 'package:admin_events/features/qr_scanner/domain/entities/guest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_data.freezed.dart';

abstract class QRData {
  const QRData();
}

class QRDataInitial extends QRData {
  const QRDataInitial();
}

class QRDataInvalid extends QRData {
  const QRDataInvalid();
}


@freezed
class QRDataValid extends QRData with _$QRDataValid {
  const factory QRDataValid({
    required Guest guest
  }) = _QRDataValid;
}
