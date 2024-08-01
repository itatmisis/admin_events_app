part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventSubscriptionRequested extends AuthEvent {
  const AuthEventSubscriptionRequested();
}

@Freezed(equal: false)
class AuthEventLoginChanged extends AuthEvent
    with EquatableMixin, _$AuthEventLoginChanged {
  const AuthEventLoginChanged._();

  const factory AuthEventLoginChanged({required String login}) =
      _AuthEventLoginChanged;

  @override
  List<Object?> get props => [login];
}

@Freezed(equal: false)
class AuthEventPasswordChanged extends AuthEvent
    with EquatableMixin, _$AuthEventPasswordChanged {
  const AuthEventPasswordChanged._();

  const factory AuthEventPasswordChanged({required String password}) =
      _AuthEventPasswordChanged;

  @override
  List<Object?> get props => [password];
}

class AuthEventLogIn extends AuthEvent {
  const AuthEventLogIn();
}
