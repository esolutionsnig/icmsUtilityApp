// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_resp.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

UsersResp _$UsersRespFromJson(Map<String, dynamic> json) =>
    new UsersResp((json['Data'] as List)
        ?.map((e) =>
            e == null ? null : new User.fromJson(e as Map<String, dynamic>))
        ?.toList())
      ..Page = json['Page'] as int
      ..Size = json['Size'] as int
      ..Count = json['Count'] as int;

abstract class _$UsersRespSerializerMixin {
  List<User> get Data;
  int get Page;
  int get Size;
  int get Count;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Data': Data,
        'Page': Page,
        'Size': Size,
        'Count': Count
      };
}
