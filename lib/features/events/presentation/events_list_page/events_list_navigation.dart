import 'package:admin_events/features/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseEventsListNavigation {
  void pushEvent(BuildContext context, String eventId);
}

class EventsListNavigation implements BaseEventsListNavigation {
  @override
  void pushEvent(BuildContext context, String eventId) {
    context.router.push(EventRoute(eventId: eventId));
  }

}