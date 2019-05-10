// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) =>
    new User(json['Email'] as String, json['FirstName'] as String)
      ..ApplicationUserId = json['ApplicationUserId'] as String
      ..LastName = json['LastName'] as String
      ..PhoneNumber = json['PhoneNumber'] as String
      ..Gender = json['Gender'] as String
      ..DefaultCountryId = json['DefaultCountryId'] as int
      ..DateRegistered = json['DateRegistered'] as String
      ..StoreName = json['StoreName'] as String
      ..StoreDescription = json['StoreDescription'] as String
      ..CountryId = json['CountryId'] as int
      ..IsActivated = json['IsActivated'] as bool;

abstract class _$UserSerializerMixin {
  String get ApplicationUserId;
  String get Email;
  String get FirstName;
  String get LastName;
  String get PhoneNumber;
  String get Gender;
  int get DefaultCountryId;
  String get DateRegistered;
  bool get IsActivated;
  String get StoreName;
  String get StoreDescription;
  int get CountryId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ApplicationUserId': ApplicationUserId,
        'Email': Email,
        'FirstName': FirstName,
        'LastName': LastName,
        'PhoneNumber': PhoneNumber,
        'Gender': Gender,
        'DefaultCountryId': DefaultCountryId,
        'DateRegistered': DateRegistered,
        'IsActivated': IsActivated,
        'StoreName': StoreName,
        'StoreDescription': StoreDescription,
        'CountryId': CountryId
      };
}
