import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/guest_repository.dart';
import 'package:admin_events/features/qr_scanner/domain/repositories/qr_repository.dart';
import 'package:admin_events/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final QRRepository qrRepository;
  final GuestRepository guestRepository;

  const App(
      {super.key, required this.authRepository, required this.userRepository, required this.qrRepository, required this.guestRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider.value(
        value: authRepository,
      ),
      RepositoryProvider.value(
        value: userRepository,
      ),
      RepositoryProvider.value(
        value: qrRepository,
      ),
      RepositoryProvider.value(
        value: guestRepository,
      )
    ], child: AppView());
  }
}

class AppView extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
