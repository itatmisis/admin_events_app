import 'package:admin_events/features/auth/data/auth/mock_auth_api.dart';
import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MockAuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Stream<AuthStatus> getStatus() => _authApi.getStatus();

  @override
  Future<void> logIn(LoginCredentials credentials) =>
      _authApi.logIn(credentials);
  @override
  Future<void> logOut() => _authApi.logOut();
}
