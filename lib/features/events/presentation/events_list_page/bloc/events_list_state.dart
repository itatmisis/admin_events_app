part of 'events_list_bloc.dart';

@freezed
class EventsListState with _$EventsListState {
  const factory EventsListState({
    required List<Event> events

  }) = _EventsListState;
}
