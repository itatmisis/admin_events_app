import 'package:admin_events/features/qr_scanner/domain/entities/guest.dart';
import 'package:admin_events/features/qr_scanner/domain/entities/qr_data.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:admin_events/utilities/deferred_image.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class MockQRRepository implements QRRepository {
  late final BehaviorSubject<QRData> _qrController = BehaviorSubject<QRData>.seeded(const QRDataInitial());
  
  int counter = 0;

  @override
  Stream<QRData> getQrResult() => _qrController.asBroadcastStream();

  @override
  Future<void> checkQR(String data) async {
    if (counter % 2 == 0) {
      Future.delayed(const Duration(milliseconds: 500));
      _qrController.add(const QRDataInvalid());
    } else {
      Future.delayed(const Duration(milliseconds: 500));
      _qrController.add( QRDataValid(
          guest: Guest(photoData: DeferredImage(() async {
            var imageBytes = await rootBundle.load('assets/me.jpg');
            return imageBytes.buffer.asUint8List();
          }), name: 'Gennady'))
      );
    }
    counter++;
  }
}