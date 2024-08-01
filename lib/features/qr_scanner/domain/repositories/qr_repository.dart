import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';

abstract class QRRepository {
  Stream<QRData> getQrResult();

  Future<void> checkQR(String data);
}