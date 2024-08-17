part of 'event_bloc.dart';

@freezed
class EventState with _$EventState {
  const factory EventState({
    Event? event,
    required bool notFound,
  }) = _EventState;
}
