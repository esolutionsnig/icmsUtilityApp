import 'package:json_annotation/json_annotation.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class UserLoginResp extends Object with _$UserLoginRespSerializerMixin {
  UserLoginResp(this.access_token, this.userName);

  String access_token;
  String refresh_token;
  String token_type;
  int expires_in; //sec
  String userName;
  @JsonKey(name: '.expires')
  String expires;
  @JsonKey(name: '.issued')
  String issued;
  String roles;

  bool canLogin = false;

  String error; //for login
  String invalid_grant; //for login
  String error_description;

  factory UserLoginResp.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRespFromJson(json);

  static String getRoles(List roles) {
    StringBuffer buffer = new StringBuffer();
    for (int i = 0; i < roles.length; i++) {
      buffer.write(roles[i]);
      if (i < (roles.length - 1)) {
        buffer.write(",");
      }
    }
    return buffer.toString();
  }
}
