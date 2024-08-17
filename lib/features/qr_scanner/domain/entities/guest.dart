import 'dart:typed_data';

import 'package:admin_events/utilities/deferred_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';

@freezed
class Guest with _$Guest {
  const factory Guest({
    required DeferredImage photoData,
    required String name,
  }) = _Guest;

}
