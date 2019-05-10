import 'package:flutter/material.dart';

class MessageUtils {
  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'Something went wrong, try again later.'),
    ));
  }
}
