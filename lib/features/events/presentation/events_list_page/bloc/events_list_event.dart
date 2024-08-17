part of 'events_list_bloc.dart';

@freezed
class EventsListEvent with _$EventsListEvent {
  const factory EventsListEvent.started() = _Started;
}
