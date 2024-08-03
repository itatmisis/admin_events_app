import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/login_credentials.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository)
      : super(const AuthState(
            status: BlocAuthStatus.initial, login: '', password: '')) {
    on<AuthEventSubscriptionRequested>(_onAuthEventSubscriptionRequested);
    on<AuthEventLogIn>(_onAuthEventLogIn);
    on<AuthEventLoginChanged>(_onAuthEventLoginChanged);
    on<AuthEventPasswordChanged>(_onAuthEventPasswordChanged);
  }

  Future<void> _onAuthEventSubscriptionRequested(
      AuthEventSubscriptionRequested event, Emitter<AuthState> emit) async {
    await emit.forEach(_authRepository.getStatus(),
        onData: _onAuthEventSubscriptionData,
        onError: (_, __) => state.copyWith(status: BlocAuthStatus.failure));
  }

  AuthState _onAuthEventSubscriptionData(AuthStatus authStatus) {
    if (authStatus is AuthStatusAuthenticated) {
      return state.copyWith(status: BlocAuthStatus.authenticated);
    }

    if (authStatus is AuthStatusInvalidCredentials) {
      return state.copyWith(status: BlocAuthStatus.wrongCredentials);
    }

    if (authStatus is AuthStatusFailure) {
      return state.copyWith(status: BlocAuthStatus.failure);
    }

    return state;
  }

  Future<void> _onAuthEventLogIn(
      AuthEventLogIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: BlocAuthStatus.inProgress));
    _authRepository.logIn(LoginCredentials(
        userIdentifier: state.login, password: state.password));
  }

  Future<void> _onAuthEventLoginChanged(
      AuthEventLoginChanged event, Emitter<AuthState> emit) async {
    emit(state.copyWith(login: event.login));
  }

  Future<void> _onAuthEventPasswordChanged(
      AuthEventPasswordChanged event, Emitter<AuthState> emit) async {
    emit(state.copyWith(password: event.password));
  }
}
