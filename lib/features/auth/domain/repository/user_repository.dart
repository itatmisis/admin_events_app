import 'package:admin_events/features/auth/domain/entities/user.dart';

abstract interface class UserRepository {
  Stream<User?> getUser();
}
