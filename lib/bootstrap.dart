import 'package:admin_events/app/app.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';

void bootstrap(AuthRepository authRepository, UserRepository userRepository) {
  runApp(App(authRepository: authRepository, userRepository: userRepository));
}
