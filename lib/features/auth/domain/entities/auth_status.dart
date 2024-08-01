import 'package:admin_events/features/auth/domain/entities/user_credentials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

class AuthStatus {
  const AuthStatus();
}

class AuthStatusUnknown extends AuthStatus {
  const AuthStatusUnknown();
}

class AuthStatusUnauthenticated extends AuthStatus {
  const AuthStatusUnauthenticated();
}

@freezed
class AuthStatusAuthenticated extends AuthStatus
    with _$AuthStatusAuthenticated {
  const factory AuthStatusAuthenticated(
      {required UserCredentials credentials}) = _AuthStatusAuthenticated;
}

class AuthStatusInvalidCredentials extends AuthStatus {
  const AuthStatusInvalidCredentials();
}

@freezed
class AuthStatusFailure extends AuthStatus with _$AuthStatusFailure {
  const factory AuthStatusFailure({required String error}) = _AuthStatusFailure;
}
