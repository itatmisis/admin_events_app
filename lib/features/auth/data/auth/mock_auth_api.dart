import 'package:admin_events/features/auth/domain/api/auth_api.dart';
import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';
import 'package:admin_events/features/auth/domain/entities/user_credentials.dart';
import 'package:rxdart/rxdart.dart';

class MockAuthApi implements AuthApi {
  late final _statusController = BehaviorSubject<AuthStatus>.seeded(const UnknownAuthStatus());

  @override
  Stream<AuthStatus> getStatus() => _statusController.asBroadcastStream();

  @override
  Future<void> logIn(LoginCredentials credentials) async {
    await Future.delayed(Duration(seconds: 2));
    _statusController.add(const AuthenticatedAuthStatus(credentials: UserCredentials(token: '')));
  }

  @override
  Future<void> logOut() async {
    _statusController.add(const UnauthenticatedAuthStatus());
  }

  @override
  Future<void> close() async {
    _statusController.close();
  }
}