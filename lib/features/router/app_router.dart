import 'package:admin_events/features/auth/presentation/auth_page/auth_page.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, initial: true)
  ];

}