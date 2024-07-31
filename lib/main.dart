import 'package:admin_events/bootstrap.dart';
import 'package:admin_events/features/auth/data/auth/auth_repository.dart';
import 'package:admin_events/features/auth/data/auth/mock_auth_api.dart';
import 'package:admin_events/features/auth/data/user/mock_user_api.dart';
import 'package:admin_events/features/auth/data/user/user_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authApi = MockAuthApi();
  final authRepository = AuthRepository(authApi);

  final userApi = MockUserApi(authRepository);
  final userRepository = UserRepository(userApi);

  bootstrap(authRepository, userRepository);
}
