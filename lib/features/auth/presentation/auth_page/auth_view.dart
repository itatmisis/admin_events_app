import 'package:admin_events/features/auth/presentation/auth_page/auth_navigation.dart';
import 'package:admin_events/features/auth/presentation/auth_page/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final navigation = context.read<BaseAuthNavigation>();

        if (state.status == BlocAuthStatus.authenticated) {
          if (navigation.canPop) {
            navigation.popWithResult(context);
            return;
          }
          navigation.replaceEventsPage(context);
        }
      },
      child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/itam_pixel.png', filterQuality: FilterQuality.none,),
                  const Padding(padding: EdgeInsets.all(24)),
                  const _LoginField(),
                  const Padding(padding: EdgeInsets.all(8)),
                  const _PasswordField(),
                  const Padding(padding: EdgeInsets.all(4)),
                  _ErrorMessage(),
                  const Padding(padding: EdgeInsets.all(8)),
                  _LoginButton()
                ],
              ),
            ),
          )
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('authPage_loginInput_textField'),
      onChanged: (l) =>
          context.read<AuthBloc>().add(AuthEventLoginChanged(login: l)),
      decoration: const InputDecoration(labelText: 'Логин'),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('authPage_passwordInput_textField'),
      onChanged: (p) =>
          context.read<AuthBloc>().add(AuthEventPasswordChanged(password: p)),
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Пароль'),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentStatus = context.select(
          (AuthBloc bloc) => bloc.state.status,
    );

    var message = '';

    switch (currentStatus) {
      case BlocAuthStatus.wrongCredentials:
        message = 'Неправильно введены данные';
      case BlocAuthStatus.failure:
        message = 'Ошибка при связи с сервером';
      default:
        break;
    }

    return Text(
      message,
      style: const TextStyle(color: Colors.red),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final currentStatus = context.select(
          (AuthBloc bloc) => bloc.state.status,
    );

    if (currentStatus == BlocAuthStatus.authenticated ||
        currentStatus == BlocAuthStatus.inProgress) {
      return Text('Загрузка...', style: theme.textTheme.headlineMedium);
    }

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        key: const Key('authPage_login_elevatedButton'),
        onPressed: () => context.read<AuthBloc>().add(const AuthEventLogIn()),
        child: const Text('Войти'),
      ),
    );
  }
}