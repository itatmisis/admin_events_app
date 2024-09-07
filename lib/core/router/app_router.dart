import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/presentation/auth_guard/auth_guard.dart';
import 'package:admin_events/features/auth/presentation/auth_page/auth_page.dart';
import 'package:admin_events/features/events/presentation/event_page/event_page.dart';
import 'package:admin_events/features/events/presentation/events_list_page/events_list_page.dart';
import 'package:admin_events/features/qr_scanner/presentation/scanner_page/scanner_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthRepository authRepository;

  late final AuthGuard authGuard = AuthGuard(authRepository);

  AppRouter(this.authRepository);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, initial: true),
    AutoRoute(page: ScannerRoute.page, guards: [authGuard]),
    AutoRoute(page: EventsListRoute.page, guards: [authGuard]),
    AutoRoute(path: '/event/:eventId', page: EventRoute.page, guards: [authGuard])
  ];
}
