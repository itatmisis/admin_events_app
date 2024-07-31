import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_credentials.freezed.dart';

@freezed
class LoginCredentials with _$LoginCredentials {
  const factory LoginCredentials({
    required String userIdentifier,
    required String password
  }) = _LoginCredentials;
}