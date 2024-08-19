import 'package:admin_events/features/auth/domain/repository/auth_repository.dart';
import 'package:admin_events/features/auth/presentation/auth_page/auth_navigation.dart';
import 'package:admin_events/features/auth/presentation/auth_page/auth_view.dart';
import 'package:admin_events/features/auth/presentation/auth_page/bloc/auth_bloc.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  final void Function()? onResult;

  const AuthPage({super.key, this.onResult});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(context.read<AuthRepository>())
        ..add(const AuthEventSubscriptionRequested()),
      child: Provider<BaseAuthNavigation>(
        create: (_) => AuthNavigation(onResult),
        child: const AuthView(),
      ),
    );
  }
}
