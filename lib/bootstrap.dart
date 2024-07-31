import 'package:admin_events/app/app.dart';
import 'package:admin_events/features/auth/data/auth/auth_repository.dart';
import 'package:admin_events/features/auth/data/user/user_repository.dart';
import 'package:admin_events/features/auth/domain/api/auth_api.dart';
import 'package:admin_events/features/auth/domain/api/user_api.dart';
import 'package:flutter/widgets.dart';

void bootstrap(AuthRepository authRepository, UserRepository userRepository) {
  runApp(
     App(
         authRepository: authRepository,
         userRepository: userRepository
     )
  );
}