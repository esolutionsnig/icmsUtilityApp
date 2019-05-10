import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:icms_app/colors.dart';
import 'package:icms_app/datamodel/language.dart';
import 'package:icms_app/datamodel/opcountries.dart';
import 'package:icms_app/datamodel/register_req_obj.dart';
import 'package:icms_app/repository/user_repository.dart';
import 'package:icms_app/utils/misc_utils.dart';
import 'package:icms_app/utils/msg_utils.dart';
import 'package:icms_app/utils/pref_utils.dart';
import 'package:icms_app/views/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:icms_app/datamodel/user.dart';
import 'package:icms_app/repository/base_repository.dart';

class RegisterScreen extends StatefulWidget {
  static const int s_n0 = 1;

  User merchant;

  GlobalKey<ScaffoldState> scaffoldKey;

  RegisterScreen(this.scaffoldKey);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  User merchant;

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _storenameController = TextEditingController();
  final _storedescriptionController = TextEditingController();
  final _countryController = TextEditingController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  RegisterReqObj registerReqObj;
  String _firstNameError, _lastNameError, _emailError, numberError,
      _storeNameError, _storeDescriptionError;

  var _isLoading = false;

  List<Language> languages = new List();
  List<String> banks = new List();
  List<Opcountries> countries = new List();

  Language _curLanguage;
  String _curBank;
  Opcountries _curCountry;

  String authToken;


  String _selectedBank;
  String url = "http://api.afrimart.com/api/Utility/banks/";
  List datas = [{'Id': "0", 'FullName': "Fetching Banks..."}];
  Future<String> getBanks(chosenCountryId) async {
    var res = await http
        .get(Uri.encodeFull(url + chosenCountryId ), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      datas = resBody["Data"];
    });
    return "Sucess";
  }



  @override
  void initState() {
    _initSpinners();
    _fetchToken();
  }


  _fetchToken() async {
    _sharedPreferences = await _prefs;
    authToken = PreferenceUtils.getToken(_sharedPreferences);

    if (authToken == null) {
      UserRepository.logOut(
          widget.scaffoldKey.currentContext, _sharedPreferences);
    }
  }


  Future<Null> _successDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Merchant Registered'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Merchant Registered Successfully.'),
                new Text('An email has been sent to the registered email.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _successDialogIOS() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new CupertinoAlertDialog(
          title: new Text('Merchant Registered'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Merchant Registered Successfully.'),
                new Text('An email has been sent to the registered email.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onCountryChange(Opcountries value) {
    setState(() {
      _curCountry = value;
      var chosenCountryId = value.Id;
      String convertedCountryId = chosenCountryId.toString();
      getBanks(convertedCountryId);
    });
  }

  void onBankChange(String value) {
    setState(() {
      _curBank = value;
    });
  }

  void onLangChange(Language value) {
    setState(() {
      _curLanguage = value;
    });
  }


  @override
  Widget build(BuildContext context) {


    if (_isLoading) {
      return Center(
        child: new Loader(),
      );
    } else {
      return SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 16.0),
            PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                controller: _firstnameController,
                decoration: InputDecoration(
                    labelText: 'First Name', errorText: _firstNameError),
              ),
            ),
            const SizedBox(height: 12.0),
            new PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                    labelText: 'Last Name', errorText: _lastNameError),
              ),
            ),
            const SizedBox(height: 12.0),
            PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration:
                InputDecoration(labelText: 'Email', errorText: _emailError),
              ),
            ),
            const SizedBox(height: 12.0),
            PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    labelText: 'Number', errorText: numberError),
              ),
            ),

            const SizedBox(height: 12.0),
            InputDecorator(
              decoration: const InputDecoration(
//                icon: const Icon(Icons.flag),
                labelText: 'Country',
                contentPadding: EdgeInsets.fromLTRB(12.0, 1.5, 12.0, 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Opcountries>(
                  value: _curCountry,
                  items: countries.map((Opcountries value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.Name),
                    );
                  }).toList(),
                  onChanged: onCountryChange,
                ),
              ),
            ),

            const SizedBox(height: 12.0),
            InputDecorator(
              decoration: const InputDecoration(
//                icon: const Icon(Icons.flag),
                labelText: 'Bank',
                contentPadding: EdgeInsets.fromLTRB(12.0, 1.5, 12.0, 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: new DropdownButton(
                  items: datas.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item['FullName']),
                      value: item['Id'].toString(),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      _selectedBank = newVal;
                    });
                  },
                  value: _selectedBank,
                ),
              ),
            ),

            const SizedBox(height: 12.0),
            InputDecorator(
              decoration: const InputDecoration(
//                icon: const Icon(Icons.flag),
                labelText: 'Language',
                contentPadding: EdgeInsets.fromLTRB(12.0, 1.5, 12.0, 1.5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: _curLanguage,
                  items: languages.map((Language value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.Name),
                    );
                  }).toList(),
                  onChanged: onLangChange,
                ),
              ),
            ),
            const SizedBox(height: 12.0),


            const SizedBox(height: 12.0),
            new PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                controller: _storenameController,
                decoration: InputDecoration(
                    labelText: 'Store Name', errorText: _storeNameError),
              ),
            ),
            const SizedBox(height: 12.0),
            new PrimaryColorOverride(
              color: cblack87,
              child: TextField(
                controller: _storedescriptionController,
                decoration: InputDecoration(
                    labelText: 'Store Description', errorText: _storeDescriptionError),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CLEAR'),
                  onPressed: () {
//                    _clearFields();
                  },
                ),
                RaisedButton(
                  child: Text('REGISTER'),
                  elevation: 8.0,
                  onPressed: () {
                    if (_validated()) {
                      _registerUser(context);
                    } else {
                      setState(() {
                        _firstNameError;
                        _lastnameController;
                        _emailError;
                        numberError;
                        _storeNameError;
                        _storeDescriptionError;
                      });
                    }
                  },
                ),

              ],
            ),
          ],
        ),
      );
    }
  }

  void _registerUser(BuildContext context) {
    _showProgressBar(true);
    UserRepository
        .get(context)
        .registerUser(registerReqObj, authToken)
        .then((response) {
      if (response.isOk()) {
        _clearFields();
        switch (Theme.of(context).platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            _successDialog();
            break;
          case TargetPlatform.iOS:
            _successDialogIOS();
            break;
        }

        _showProgressBar(false);
      } else {
        _showProgressBar(false);

        MessageUtils.showSnackBar(widget.scaffoldKey, response.body);
      }
    });
  }

  void _initSpinners() {
//    FutureBuilder<List<Allcountries>>(
//      future: fetchPosts(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return Container();
//        List<Allcountries> posts = snapshot.data;
//        return new ListView(
//          children: posts.map((post) => Text(post.cuntname)).toList(),
//        );
//      },
//    );


    languages.addAll([
      Language(1, "English"),
      Language(2, "French"),
      Language(3, "Swahili"),
    ]);
    banks.addAll([
      "Access Bank",
      "Citibank",
      "Coronation Merchant Bank",
      "Diamond Bank",
      "Ecobank Nigeria",
      "FBN Merchant Bank",
      "Fidelity Bank Nigeria",
      "First Bank of Nigeria",
      "First City Monument Bank",
      "FSDH Merchant Bank",
      "Guaranty Trust Bank",
      "Heritage Bank plc",
      "Jaiz Bank",
      "Keystone Bank",
      "Nova Merchant Bank",
      "Providus Bank",
      "Rand Merchant Bank",
      "Skye Bank",
      "Stanbic IBTC Bank Nigeria",
      "Standard Chartered Bank",
      "Sterling Bank ",
      "Suntrust Bank Nigeria",
      "Union Bank of Nigeria",
      "United Bank for Africa",
      "Unity Bank",
      "Wema Bank",
      "Zenith Bank",
    ]);
    countries.addAll([
      Opcountries(3, "Angola"),
      Opcountries(18, "Burundi"),
      Opcountries(20, "Benin"),
      Opcountries(21, "Burkina Faso"),
      Opcountries(37, "Botswana"),
      Opcountries(38, "Central African Republic"),
      Opcountries(44, "Ivory Coast"),
      Opcountries(45, "Cameroon"),
      Opcountries(46, "DR Congo"),
      Opcountries(47, "Republic of the Congo"),
      Opcountries(50, "Comoros"),
      Opcountries(51, "Cape Verde"),
      Opcountries(60, "Djibouti"),
      Opcountries(64, "Algeria"),
      Opcountries(66, "Egypt"),
      Opcountries(67, "Eritrea"),
      Opcountries(68, "Western Sahara"),
      Opcountries(71, "Ethiopia"),
      Opcountries(78, "Gabon"),
      Opcountries(82, "Ghana"),
      Opcountries(162, "Niger"),
      Opcountries(164, "Nigeria"),
      Opcountries(188, "Réunion"),
      Opcountries(191, "Rwanda"),
      Opcountries(193, "Sudan"),
      Opcountries(194, "Senegal"),
      Opcountries(199, "Sierra Leone"),
      Opcountries(202, "Somalia"),
      Opcountries(205, "South Sudan"),
      Opcountries(206, "São Tomé and Príncipe"),
      Opcountries(211, "Swaziland"),
      Opcountries(213, "Seychelles"),
      Opcountries(216, "Chad"),
      Opcountries(217, "Togo"),
      Opcountries(255, "Tunisia"),
      Opcountries(299, "Tanzania"),
      Opcountries(230, "Uganda"),
      Opcountries(246, "South Africa"),
      Opcountries(247, "Zambia"),
      Opcountries(248, "Zimbabwe"),
    ]);
    _curLanguage = languages[0];
    _curBank = banks[0];
    _curCountry = countries[0];
  }

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

  bool _validated() {
    registerReqObj = RegisterReqObj();

    bool valid = true;
    registerReqObj.FirstName = _firstnameController.text;
    if (_firstnameController.text.isEmpty) {
      valid = false;
      _firstNameError = "First name can't be blank!";
    } else {
      _firstNameError = null;
    }

    registerReqObj.LastName = _lastnameController.text;
    if (_lastnameController.text.isEmpty) {
      valid = false;
      _lastNameError = "Last name can't be blank!";
    } else {
      _lastNameError = null;
    }
    registerReqObj.Email = _emailController.text;
    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    } else if (!_emailController.text.contains(Validator.regex)) {
      valid = false;
      _emailError = "Enter a valid email!";
    } else {
      _emailError = null;
    }
    registerReqObj.Phone = _numberController.text;
    if (_numberController.text.isEmpty) {
      valid = false;
      numberError = "Enter a valid phone number!";
    } else {
      numberError = null;
    }
    registerReqObj.StoreName = _storenameController.text;
    if (_storenameController.text.isEmpty) {
      valid = false;
      _storeNameError = "Store name can't be blank!";
    } else {
      _storeNameError = null;
    }
    registerReqObj.StoreDescription = _storedescriptionController.text;
    if (_storedescriptionController.text.isEmpty) {
      valid = false;
      _storeDescriptionError = "Store dscription can't be blank!";
    } else {
      _storeDescriptionError = null;
    }

    registerReqObj.CountryId = _curCountry.Id;
    registerReqObj.Bank = _curBank;
    registerReqObj.PreferredLanguageId = _curLanguage.Id;

    return valid;
  }

  void _clearFields() {
    _firstnameController.clear();
    _lastnameController.clear();
    _emailController.clear();
    _numberController.clear();
    _storenameController.clear();
    _storedescriptionController.clear();
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
