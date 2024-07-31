import 'package:admin_events/features/auth/domain/api/user_api.dart';
import 'package:admin_events/features/auth/domain/entities/user.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository(this._userApi);

  Stream<User?> getUser() => _userApi.getUser();
}