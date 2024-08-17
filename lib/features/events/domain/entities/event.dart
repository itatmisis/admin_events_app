
import 'package:admin_events/utilities/deferred_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required DeferredImage image,
    required String title,
    required String description,
  }) = _Event;

}