part of 'auth_bloc.dart';


enum BlocAuthStatus {
  initial,
  authenticated,
  inProgress,
  wrongCredentials,
  failure
}

@Freezed(equal: false)
class AuthState with EquatableMixin, _$AuthState {
  const AuthState._();

  const factory AuthState(
      {required BlocAuthStatus status,
      required String login,
      required String password}) = _AuthState;

  @override
  List<Object?> get props => [status, login, password];
}
