import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget loader = CircularProgressIndicator();
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        loader = CircularProgressIndicator();
        break;
      case TargetPlatform.iOS:
        loader = CupertinoActivityIndicator();
    }
    return loader;
  }
}
