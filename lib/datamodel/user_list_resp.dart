import 'package:icms_app/datamodel/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_list_resp.g.dart';

@JsonSerializable()
class UsersResp extends Object with _$UsersRespSerializerMixin {

  UsersResp(this.Data);

  List<User> Data;
  int Page;
  int Size;
  int Count;

  factory UsersResp.fromJson(Map<String, dynamic> json) => _$UsersRespFromJson(json);
}
