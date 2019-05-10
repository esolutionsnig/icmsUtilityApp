// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

UserLoginResp _$UserLoginRespFromJson(Map<String, dynamic> json) =>
    new UserLoginResp(
        json['access_token'] as String, json['userName'] as String)
      ..refresh_token = json['refresh_token'] as String
      ..token_type = json['token_type'] as String
      ..expires_in = json['expires_in'] as int
      ..expires = json['.expires'] as String
      ..issued = json['.issued'] as String
      ..roles = json['roles'] as String
      ..canLogin = json['canLogin'] as bool
      ..error = json['error'] as String
      ..invalid_grant = json['invalid_grant'] as String
      ..error_description = json['error_description'] as String;

abstract class _$UserLoginRespSerializerMixin {
  String get access_token;
  String get refresh_token;
  String get token_type;
  int get expires_in;
  String get userName;
  String get expires;
  String get issued;
  String get roles;
  bool get canLogin;
  String get error;
  String get invalid_grant;
  String get error_description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': access_token,
        'refresh_token': refresh_token,
        'token_type': token_type,
        'expires_in': expires_in,
        'userName': userName,
        '.expires': expires,
        '.issued': issued,
        'roles': roles,
        'canLogin': canLogin,
        'error': error,
        'invalid_grant': invalid_grant,
        'error_description': error_description
      };
}
