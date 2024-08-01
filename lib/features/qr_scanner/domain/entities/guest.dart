import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';

@freezed
class Guest with _$Guest {
  const factory Guest({
    required Future<Uint8List> Function() photoData,
    required String name,
  }) = _Guest;

}
