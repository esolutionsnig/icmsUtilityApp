import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:icms_app/datamodel/user_list_resp.dart';
import 'package:icms_app/datamodel/parsed_response.dart';
import 'package:icms_app/datamodel/register_req_obj.dart';
import 'package:icms_app/datamodel/user_login_response.dart';
import 'package:icms_app/repository/base_repository.dart';
import 'package:icms_app/utils/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends BaseRepository {
  static UserRepository _repo;

  static const String ROLE_MARKETER = "AfrimartMarketer";
  static const String ROLE_MARKETER_ADMIN = "AfrimartMarketerAdmin";

  BuildContext context;

  static UserRepository get(BuildContext context) {
    if (_repo == null) {
      _repo = new UserRepository._internal(context);
    }
    return _repo;
  }

  UserRepository._internal(this.context);

  Future<ParsedResponse<UserLoginResp>> loginUser(
      String email, String password) async {
    String url = baseUrl + "/auth/login";

    Map loginRequest = {
      'email': email,
      'password': password
    };

    Response response = await post(
      url,
      headers: {
        "content_type": "application/x-www-form-urlencoded; charset=utf-8"
      },
      body: loginRequest,
    ).timeout(const Duration(seconds: 115)).catchError((error) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      Map loginMap = json.decode(response.body);
      var loginUser = new UserLoginResp.fromJson(loginMap);

      loginUser.error_description =
          BaseRepository.getErrorMessage(loginUser.error_description, context);

      return new ParsedResponse(response.statusCode, loginUser);
    }
    Map loginMap = json.decode(response.body);
    var loginUser = new UserLoginResp.fromJson(loginMap);
    // List roles = json.decode(loginUser.roles);
    // if (roles.contains(ROLE_MARKETER)) {
    //   loginUser.canLogin = true;
    // }
    // loginUser.roles = UserLoginResp.getRoles(roles);
    loginUser.canLogin = true;
    return new ParsedResponse(response.statusCode, loginUser);
  }

  Future<ParsedResponse<String>> registerUser(
      RegisterReqObj reqObj, String token) async {
    String url = baseUrl + "/api/Marketer/users";

    Map regRequest = {
      'FirstName': reqObj.FirstName,
      'LastName': reqObj.LastName,
      'Email': reqObj.Email,
      'Phone': reqObj.Phone,
      'PreferredLanguageId': reqObj.PreferredLanguageId,
      'Bank': reqObj.Bank,
      'StoreName': reqObj.StoreName,
      'StoreDescription': reqObj.StoreDescription,
      'CountryId': reqObj.CountryId
    };

    String jsonString = json.encode(regRequest);
    Response response = await post(url, body: jsonString, headers: {
      "Authorization": "Bearer " + token,
      'Content-Type': 'application/json;charset=utf-8'
    }).timeout(const Duration(seconds: 115)).catchError((error) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      var error = BaseRepository.getErrorMessage(response.body, context);
      return new ParsedResponse(response.statusCode, error);
    }
    return new ParsedResponse(response.statusCode, null);
  }

  Future<ParsedResponse<UsersResp>> getRegisteredUsers(String token) async {
    String url = baseUrl + "/api/Marketer/users?size=1000";

    Response response = await http
        .get(url, headers: {
          "Authorization": "Bearer " + token,
          'Content-Type': 'application/json;charset=utf-8'
        })
        .timeout(const Duration(seconds: 115))
        .catchError((error) {
          return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
        });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      Map respMap = json.decode(response.body);
      var resp = ParsedResponse<UsersResp>(0, null);
      resp.message = respMap['Message'];
      resp.message = BaseRepository.getErrorMessage(resp.message, context);
      return resp;
    }
    Map respMap = json.decode(response.body);
    var respObj = new UsersResp.fromJson(respMap);
    return new ParsedResponse(response.statusCode, respObj);
  }

  Future<ParsedResponse<UsersResp>> getMarketers(String token) async {
    String url = baseUrl + "/api/Admin/Users?isAfrimartMarketer=true";

    Response response = await http
        .get(url, headers: {
          "Authorization": "Bearer " + token,
          'Content-Type': 'application/json;charset=utf-8'
        })
        .timeout(const Duration(seconds: 115))
        .catchError((error) {
          return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
        });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      Map respMap = json.decode(response.body);
      var resp = ParsedResponse<UsersResp>(0, null);
      resp.message = respMap['Message'];
      resp.message = BaseRepository.getErrorMessage(resp.message, context);
      return resp;
    }
    Map respMap = json.decode(response.body);
    var respObj = new UsersResp.fromJson(respMap);
    return new ParsedResponse(response.statusCode, respObj);
  }

  Future<ParsedResponse<UsersResp>> getMarketerUsers(
      String token, String marketerId) async {
    String url = baseUrl + "/api/Admin/Users/registrar?id=" + marketerId;

    Response response = await http
        .get(url, headers: {
          "Authorization": "Bearer " + token,
          'Content-Type': 'application/json;charset=utf-8'
        })
        .timeout(const Duration(seconds: 115))
        .catchError((error) {
          return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
        });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print(response.body);
      Map respMap = json.decode(response.body);
      var resp = ParsedResponse<UsersResp>(0, null);
      resp.message = respMap['Message'];
      resp.message = BaseRepository.getErrorMessage(resp.message, context);
      return resp;
    }
    Map respMap = json.decode(response.body);
    var respObj = new UsersResp.fromJson(respMap);
    return new ParsedResponse(response.statusCode, respObj);
  }

  Future<ParsedResponse<void>> logoutUser(String token) async {
    String url = baseUrl + "/api/Account/Logout";
    Response response = await post(url, body: null, headers: {
      "Authorization": "Bearer " + token,
      'Content-Type': 'application/json;charset=utf-8'
    }).timeout(const Duration(seconds: 115)).catchError((error) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    });

    if (response == null) {
      return new ParsedResponse(ParsedResponse.NO_INTERNET, null);
    }
    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }
    return new ParsedResponse(response.statusCode, null);
  }

  static void logOut(BuildContext context, SharedPreferences prefs) {
    String authToken = PreferenceUtils.getToken(prefs);
    prefs.setString(PreferenceUtils.authTokenKey, null);
    Navigator.of(context).pushReplacementNamed('/');
    UserRepository.get(context).logoutUser(authToken).then((response) {
      if (response.isOk()) {
        print("logged out");
      }
    });
  }
}
