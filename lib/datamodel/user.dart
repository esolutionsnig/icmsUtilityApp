
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {

  User(this.Email,this.FirstName);

  String ApplicationUserId;
//  String UserUniqueKey;
  String Email;
  String FirstName;
  String LastName;
  String PhoneNumber;
  String Gender;
  int DefaultCountryId;
//  int PreferredCurrencyId;
//  int CurrentRating;
//  String LastActiveTime;
  String DateRegistered;
  bool IsActivated;
//  String CurrentSubscription;
//  String PreferredLanguage;
  String StoreName;
  String StoreDescription;
  int CountryId;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
//
//void launchWebView () {
//  print("1234");
//}