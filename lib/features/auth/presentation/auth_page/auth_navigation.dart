import 'package:admin_events/features/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseAuthNavigation {
  bool get canPop;

  void popWithResult(BuildContext context);
  void replaceEventsPage(BuildContext context);
}

class AuthNavigation implements BaseAuthNavigation {
  final void Function()? onResult;

  const AuthNavigation(this.onResult);

  @override
  bool get canPop => onResult != null;

  @override
  void popWithResult(BuildContext context) {
    onResult!();
  }

  @override
  void replaceEventsPage(BuildContext context) {
    context.router.replace(const EventsListRoute());
  }
}