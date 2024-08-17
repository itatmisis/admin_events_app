import 'package:admin_events/app/app.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';
import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:flutter/widgets.dart';

void bootstrap(
    AuthRepository authRepository,
    UserRepository userRepository,
    QRRepository qrRepository,
    GuestRepository guestRepository,
    EventRepository eventRepository) {
  runApp(App(
    authRepository: authRepository,
    userRepository: userRepository,
    qrRepository: qrRepository,
    guestRepository: guestRepository,
    eventRepository: eventRepository,
  ));
}
