import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventSubscriptionRequested extends AuthEvent {
  const AuthEventSubscriptionRequested();

}

@Freezed(equal: false)
class AuthEventLoginChanged extends AuthEvent with EquatableMixin, _$AuthEventLoginChanged {
  const AuthEventLoginChanged._();

  const factory AuthEventLoginChanged({
    required String login
  }) = _AuthEventLoginChanged;

  @override
  List<Object?> get props => [login];
}


@Freezed(equal: false)
class AuthEventPasswordChanged extends AuthEvent with EquatableMixin, _$AuthEventPasswordChanged {
  const AuthEventPasswordChanged._();

  const factory AuthEventPasswordChanged({
    required String password
  }) = _AuthEventPasswordChanged;

  @override
  List<Object?> get props => [password];
}

class AuthEventLogIn extends AuthEvent {
  const AuthEventLogIn();
}