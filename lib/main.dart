import 'package:admin_events/bootstrap.dart';
import 'package:admin_events/features/auth/data/auth/auth_repository_impl.dart';
import 'package:admin_events/features/auth/data/auth/mock_auth_api.dart';
import 'package:admin_events/features/auth/data/user/mock_user_api.dart';
import 'package:admin_events/features/auth/data/user/user_repository_impl.dart';
import 'package:admin_events/features/events/data/mock_event_repository.dart';
import 'package:admin_events/features/qr_scanner/data/guest/mock_guest_repository.dart';
import 'package:admin_events/features/qr_scanner/data/qr/mock_qr_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authApi = MockAuthApi();
  final authRepository = AuthRepositoryImpl(authApi);

  final userApi = MockUserApi(authRepository);
  final userRepository = UserRepositoryImpl(userApi);

  final qrRepository = MockQRRepository();
  final guestRepository = MockGuestRepository();

  final eventRepository = MockEventRepository();

  bootstrap(authRepository, userRepository, qrRepository, guestRepository,
      eventRepository);
}
