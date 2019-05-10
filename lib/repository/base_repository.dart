import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icms_app/repository/user_repository.dart';
import 'package:icms_app/utils/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  String baseUrl = "http://xloutsourcingltd.com/icmsapp/api";
  static String authToken;
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static SharedPreferences _sharedPreferences;

  BaseRepository() {}

  static _fetchToken() async {
    _sharedPreferences = await _prefs;
    authToken = PreferenceUtils.getToken(_sharedPreferences);
  }

  static String getErrorMessage(String errorCode, BuildContext context) {
    if (errorCode.startsWith("\"")) {
      errorCode = errorCode.split("\"")[1];
    }

    if (errorCode == "401") {
      return "You must have entered invalid email or password";
    }
    if (errorCode == "10061") {
      return "This url is forbidden";
    }
    if (errorCode == "10062") {
      return "The username or password is incorrect";
    }
    if (errorCode == "10066") {
      return "This email already exists";
    }
    if (errorCode == "10067") {
      return "The registration information appears to contain invalid data";
    }
    print(errorCode);
    if (errorCode == 'Authorization has been denied for this request.') {
      _fetchToken();
      UserRepository.logOut(context, _sharedPreferences);
    }
    return 'Something went wrong, try again later.';
  }
}
