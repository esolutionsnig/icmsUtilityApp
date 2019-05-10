import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icms_app/colors.dart';
import 'package:icms_app/repository/user_repository.dart';
import 'package:icms_app/ui/homeScreen.dart';
import 'package:icms_app/utils/misc_utils.dart';
import 'package:icms_app/utils/msg_utils.dart';
import 'package:icms_app/utils/pref_utils.dart';
import 'package:icms_app/views/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:icms_app/ui/stacked_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _obscureText = true;

  String _passwordError, _userNameError;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    _fetchToken();
  }

  _fetchToken() async {
    _sharedPreferences = await _prefs;
    String authToken = PreferenceUtils.getToken(_sharedPreferences);

    if (authToken != null) {
      _goToHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: _isLoading
            ? Center(
                child: Loader(),
              )
            : SafeArea(
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 60.0,
                          ),
                          StackedIcons(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 8.0, bottom: 60.0),
                                child: Text(
                                  "Cash Center",
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 0.0),
                            child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    errorText: _userNameError),
                                keyboardType: TextInputType.emailAddress),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 0.0),
                            child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    errorText: _passwordError,
                                    suffixIcon: GestureDetector(
                                      onTap: _togglePassword,
                                      child: Icon(Icons.remove_red_eye),
                                    )),
                                keyboardType: TextInputType.text),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 5.0, top: 10.0),
                                  child: RaisedButton(
                                    child: Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                    color: cred,
                                    elevation: 6.0,
                                    onPressed: () {
                                      if (_validated()) {
                                        SystemChannels.textInput
                                            .invokeMethod('TextInput.hide');
                                        _loginUser(context);
                                      } else {
                                        setState(() {
                                          _userNameError;
                                          _passwordError;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 10.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40.0,
                                      child: Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                            fontSize: 14.0, color: cred),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }

  bool _validated() {
    bool valid = true;
    if (_usernameController.text.isEmpty) {
      valid = false;
      _userNameError = "Your email address is required!";
    } else if (!_usernameController.text.contains(Validator.regex)) {
      valid = false;
      _userNameError = "Enter a valid email address!";
    } else {
      _userNameError = null;
    }
    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Your password is required!";
    } else {
      _passwordError = null;
    }
    return valid;
  }

  // Sign User In
  void _loginUser(BuildContext context) {
    _showProgressBar(true);
    UserRepository.get(context)
        .loginUser(_usernameController.text, _passwordController.text)
        .then((response) {
      if (response.isOk()) {
        _showProgressBar(false);
        if (response.body.canLogin) {
          PreferenceUtils.saveUserDetails(_sharedPreferences, response.body);
          _goToHomePage();
        } else {
          MessageUtils.showSnackBar(_scaffoldKey,
              "You are not a registered user yet, please contact support.");
        }
      } else {
        _showProgressBar(false);
        MessageUtils.showSnackBar(
            _scaffoldKey, response.body.error_description);
      }
    }).catchError((onError) {
      _showProgressBar(false);
      MessageUtils.showSnackBar(_scaffoldKey, null);
    });
  }

  // Progress Bar
  void _showProgressBar(bool show) {
    if (show) {
      setState(() {
        _isLoading = true;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Navigate to home page
  void _goToHomePage() {
    Navigator.of(_scaffoldKey.currentContext)
        .pushReplacementNamed(HomeScreen.routeName);
  }

  // Show or Hide Password
  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
