import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:admin_events/features/events/presentation/event_page/bloc/event_bloc.dart';
import 'package:admin_events/features/events/presentation/event_page/event_navigation.dart';
import 'package:admin_events/features/events/presentation/event_page/event_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EventPage extends StatelessWidget {
  final String eventId;

  const EventPage({super.key, @pathParam required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
      create: (context) => EventBloc(context.read<EventRepository>())
        ..add(EventEvent.started(id: eventId)),
      child: Provider<BaseEventNavigation>(
        create: (_) => EventNavigation(),
        child: const EventView(),
      ),
    );
  }
}