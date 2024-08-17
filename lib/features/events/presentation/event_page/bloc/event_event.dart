part of 'event_bloc.dart';

@freezed
class EventEvent with _$EventEvent {
  const factory EventEvent.started({
    required String id
  }) = _Started;
}
