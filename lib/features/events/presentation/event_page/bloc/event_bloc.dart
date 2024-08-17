import 'package:admin_events/features/events/domain/entities/event.dart';
import 'package:admin_events/features/events/domain/repositories/event_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_event.dart';
part 'event_state.dart';
part 'event_bloc.freezed.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository _eventRepository;


  EventBloc(this._eventRepository) : super(const EventState(notFound: false)) {
    on<EventEvent>((event, emit) async {
      final meetup = await _eventRepository.getById(event.id);

      if (meetup != null) {
        emit(state.copyWith(event: meetup));
      } else {
        emit(state.copyWith(notFound: true));
      }
    });
  }
}
