import 'package:admin_events/features/auth/domain/entities/user.dart';

abstract interface class UserApi {
  Stream<User?> getUser();

  Future<void> close();
}