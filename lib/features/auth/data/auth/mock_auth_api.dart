import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';
import 'package:admin_events/features/auth/domain/entities/user_credentials.dart';
import 'package:rxdart/rxdart.dart';

class MockAuthApi {
  late final _statusController =
      BehaviorSubject<AuthStatus>.seeded(const AuthStatusUnknown());

  Stream<AuthStatus> getStatus() => _statusController.asBroadcastStream();

  Future<void> logIn(LoginCredentials credentials) async {
    await Future.delayed(Duration(seconds: 2));
    _statusController.add(
        const AuthStatusAuthenticated(credentials: UserCredentials(token: '')));
  }

  Future<void> logOut() async {
    _statusController.add(const AuthStatusUnauthenticated());
  }

  Future<void> close() async {
    _statusController.close();
  }
}
