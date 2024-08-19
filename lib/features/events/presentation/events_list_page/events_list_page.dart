import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:admin_events/features/events/presentation/events_list_page/bloc/events_list_bloc.dart';
import 'package:admin_events/features/events/presentation/events_list_page/events_list_navigation.dart';
import 'package:admin_events/features/events/presentation/events_list_page/events_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsListBloc>(
      create: (_) => EventsListBloc(context.read<EventRepository>())
        ..add(const EventsListEvent.started()),
      child: Provider<BaseEventsListNavigation>(
        create: (_) => EventsListNavigation(),
        child: const EventsListView(),
      ),
    );
  }
}