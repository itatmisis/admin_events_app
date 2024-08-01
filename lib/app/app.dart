import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/domain/repository/user_repository.dart';
import 'package:admin_events/features/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  const App(
      {super.key, required this.authRepository, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider.value(
        value: authRepository,
      ),
      RepositoryProvider.value(
        value: userRepository,
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
