import 'package:admin_events/app/app.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:flutter/widgets.dart';

void bootstrap(
    AuthRepository authRepository,
    UserRepository userRepository,
    QRRepository qrRepository,
    GuestRepository guestRepository) {
  runApp(App(authRepository: authRepository, userRepository: userRepository, qrRepository: qrRepository, guestRepository: guestRepository,));
}
