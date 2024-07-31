import 'dart:async';

import 'package:admin_events/features/auth/data/auth/auth_repository.dart';
import 'package:admin_events/features/auth/domain/api/user_api.dart';
import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/entities/user.dart';
import 'package:rxdart/rxdart.dart';

class MockUserApi implements UserApi {
  final AuthRepository _authRepository;

  late final StreamSubscription<AuthStatus> _authSubscription;

  late final _userController = BehaviorSubject<User?>.seeded(null);

  MockUserApi(this._authRepository) {
    _authSubscription = _authRepository.getStatus().listen(_onAuthStatusUpdated);
  }

  @override
  Stream<User?> getUser() => _userController.asBroadcastStream();

  @override
  Future<void> close() async {
    _authSubscription.cancel();
    _userController.close();
  }

  void _onAuthStatusUpdated(AuthStatus status) {
    _userController.add(const User(id: 'mockId'));
  }
}