import 'package:admin_events/features/auth/domain/entities/auth_status.dart';
import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/router/app_router.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthRepository authRepository;

  AuthStatus? _status;

  AuthGuard(this.authRepository) {
    onUpdate();
  }

  onUpdate() async {
    await authRepository.getStatus().forEach((s) {
      _status = s;
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(_status is AuthStatusAuthenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(const AuthRoute());
    }
  }
}