import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:admin_events/features/events/presentation/events_list_page/bloc/events_list_bloc.dart';
import 'package:admin_events/features/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsListBloc>(
      create: (_) => EventsListBloc(context.read<EventRepository>())
        ..add(const EventsListEvent.started()),
      child: const EventsListView(),
    );
  }
}

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            collapsedHeight: 80,
            title: Text(
              'Мероприятия',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BlocBuilder<EventsListBloc, EventsListState>(
            builder: (context, state) {
              return SliverList.builder(
                  itemCount: state.events.length,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: InkWell(
                          onTap: () => context.router
                              .push(EventRoute(eventId: state.events[i].id)),
                          child: Container(
                            height: 200,
                            color: const Color(0xFF333333),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(state.events[i].title),
                                      ],
                                    ),
                                  )
                                ),

                                AspectRatio(
                                  aspectRatio: 1,
                                  child:  FutureBuilder(
                                      future: state.events[i].image.load(),
                                      builder: (context, data) {
                                        if (data.hasData) {
                                          return Image.memory(data.requireData);
                                        }
                                        return const SizedBox.shrink();
                                      }
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
            },
          )
        ],
      ),
    );
  }
}
