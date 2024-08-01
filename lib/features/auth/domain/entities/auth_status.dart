import 'package:admin_events/features/auth/domain/entities/user_credentials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

class AuthStatus {
  const AuthStatus();
}

class UnknownAuthStatus extends AuthStatus {
  const UnknownAuthStatus();
}

class UnauthenticatedAuthStatus extends AuthStatus {
  const UnauthenticatedAuthStatus();
}

@freezed
class AuthenticatedAuthStatus extends AuthStatus
    with _$AuthenticatedAuthStatus {
  const factory AuthenticatedAuthStatus(
      {required UserCredentials credentials}) = _AuthenticatedAuthStatus;
}

class InvalidCredentialsAuthStatus extends AuthStatus {
  const InvalidCredentialsAuthStatus();
}

@freezed
class FailureAuthStatus extends AuthStatus with _$FailureAuthStatus {
  const factory FailureAuthStatus({required String error}) = _FailureAuthStatus;
}
