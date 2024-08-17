import 'package:admin_events/features/events/domain/entities/event.dart';
import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_list_event.dart';
part 'events_list_state.dart';
part 'events_list_bloc.freezed.dart';

class EventsListBloc extends Bloc<EventsListEvent, EventsListState> {
  final EventRepository _eventRepository;

  EventsListBloc(this._eventRepository) : super(const EventsListState(events: [])) {
    on<EventsListEvent>((event, emit) async {
      _eventRepository.update();

      await emit.forEach(
          _eventRepository.getEvents(),
          onData: (e) => state.copyWith(events: e)
      );
    });
  }
}
