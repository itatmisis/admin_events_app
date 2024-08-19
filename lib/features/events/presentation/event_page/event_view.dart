import 'package:admin_events/features/events/domain/entities/event.dart';
import 'package:admin_events/features/events/presentation/event_page/bloc/event_bloc.dart';
import 'package:admin_events/features/events/presentation/event_page/event_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<EventBloc, EventState>(
          builder: (context, state) {
            if (state.event != null) {
              return _ReadyPage(event: state.event!);
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}

class _ReadyPage extends StatelessWidget {
  final Event event;

  const _ReadyPage({
    super.key,
    required this.event
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: const Color(0xFF333333),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title),
                      ],
                    ),
                  )
              ),

              AspectRatio(
                aspectRatio: 1,
                child:  FutureBuilder(
                    future: event.image.load(),
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

        Expanded(
          child: Center(
            child: _InstructionText(),
          ),
        ),

        Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => context.read<BaseEventNavigation>().pushScanner(context, event.id),
                child: const Text('Открыть сканер'),
              ),
            )
        )
      ],
    );
  }
}

class _InstructionText extends StatelessWidget {
  const _InstructionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String desc = context.select((EventBloc bloc) => bloc.state.event?.description) ?? '';

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                desc,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall
            ),
          )
        ],
      ),
    );
  }
}