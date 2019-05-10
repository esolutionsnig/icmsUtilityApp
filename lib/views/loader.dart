import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icms_app/colors.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget loader = SpinKitRipple(
                  color: cred,
                  size: 60.0,
                );
    // Widget loader = CircularProgressIndicator();
    // switch (Theme.of(context).platform) {
    //   case TargetPlatform.android:
    //   case TargetPlatform.fuchsia:
    //     loader = CircularProgressIndicator();
    //     break;
    //   case TargetPlatform.iOS:
    //     loader = CupertinoActivityIndicator();
    // }
    return loader;
  }
}
