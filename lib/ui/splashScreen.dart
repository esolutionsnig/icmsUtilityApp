import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icms_app/colors.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icms_app/ui/loginScreen.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen()
      )
    );
    // Navigator.pushNamed(context, '/LoginScreen');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0), color: cred),
                  child: Icon(Icons.home, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50.0, top: 50.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0), color: cteal),
                  child: Icon(Icons.monetization_on, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30.0, top: 50.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: cpurple),
                  child: Icon(Icons.airport_shuttle, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 90.0, top: 20.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0), color: cgrey),
                  child: Icon(Icons.place, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 70.0, bottom: 60.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: corange),
                  child: Icon(Icons.business_center, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 1.0, bottom: 80.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0), color: clime),
                  child: Icon(Icons.local_shipping, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: Text(
                    "Cash Center",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: SpinKitRipple(
                  color: cred,
                  size: 60.0,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
