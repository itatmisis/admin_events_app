import 'package:admin_events/features/auth/data/user/mock_user_api.dart';
import 'package:admin_events/features/auth/domain/entities/user.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final MockUserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Stream<User?> getUser() => _userApi.getUser();
}
