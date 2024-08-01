import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';

abstract interface class AuthRepository {
  Stream<AuthStatus> getStatus();

  Future<void> logIn(LoginCredentials credentials);
  Future<void> logOut();
}
