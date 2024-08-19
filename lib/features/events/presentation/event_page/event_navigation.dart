import 'package:admin_events/features/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseEventNavigation {
  void pushScanner(BuildContext context, String eventId);
}

class EventNavigation implements BaseEventNavigation {
  @override
  void pushScanner(BuildContext context, String eventId) {
    context.router.push(ScannerRoute(eventId: eventId));
  }

}