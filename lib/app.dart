import 'package:flutter/material.dart';
import 'package:icms_app/colors.dart';
import 'package:icms_app/ui/splashScreen.dart';

import 'ui/homeScreen.dart';

class IcmsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICMS Utitlity App',
      debugShowCheckedModeBanner: false,
      theme: _kIcmsTheme,
      routes: <String,WidgetBuilder>{
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
      },
      home: SplashPage(),
    );
  }

}

// Build Custom
  final ThemeData _kIcmsTheme = _buildIcmsTheme();

  ThemeData _buildIcmsTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: cblack87,
    primaryColor: cred,
    buttonColor: cred,
    scaffoldBackgroundColor: cwhite,
    cardColor: cwhite,
    textSelectionColor: cred,
    errorColor: corange,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: cred),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
    ),
    textTheme: _buildIcmsTextTheme(base.textTheme),
    primaryTextTheme: _buildIcmsTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildIcmsTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildIcmsTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Roboto',
        displayColor: cblack87,
        bodyColor: cblack87,
      );
}