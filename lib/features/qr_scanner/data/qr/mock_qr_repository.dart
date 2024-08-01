import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockQRRepository implements QRRepository {
  late final BehaviorSubject<QRData> _qrController = BehaviorSubject<QRData>.seeded(const QRDataInitial());

  @override
  Stream<QRData> getQrResult() => _qrController.asBroadcastStream();

  @override
  Future<void> checkQR(String data) async {
    Future.delayed(const Duration(milliseconds: 500));
    _qrController.add(const QRDataInvalid());
  }
}