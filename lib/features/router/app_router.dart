import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/presentation/auth_guard/auth_guard.dart';
import 'package:admin_events/features/auth/presentation/auth_page/auth_page.dart';
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
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: ScannerRoute.page, initial: true, guards: [authGuard])
  ];
}
