import 'package:admin_events/features/auth/domain/api/auth_api.dart';
import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Stream<AuthStatus> getStatus() => _authApi.getStatus();

  Future<void> logIn(LoginCredentials credentials) => _authApi.logIn(credentials);
  Future<void> logOut() => _authApi.logOut();
}