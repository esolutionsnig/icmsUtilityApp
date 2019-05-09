import 'package:flutter/material.dart';
import 'package:icms_app/login.dart';
import 'package:icms_app/constants.dart';
import 'package:icms_app/splashscreen.dart';

void main() => runApp(IcmsApp());

class IcmsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICMS Utitlity App',
      debugShowCheckedModeBanner: false,
      // Set Raleway as the defualt app font
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.red,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder> {
        '/LoginPage': (BuildContext context) => LoginPage()
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 Container(
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0), color: cred),
//                   child: Icon(Icons.home, color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 50.0, top: 50.0),
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0), color: cteal),
//                   child: Icon(Icons.monetization_on, color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 30.0, top: 50.0),
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0),
//                       color: cpurple),
//                   child: Icon(Icons.airport_shuttle, color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 90.0, top: 20.0),
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0), color: cgrey),
//                   child: Icon(Icons.place, color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 70.0, bottom: 60.0),
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0),
//                       color: corange),
//                   child: Icon(Icons.business_center, color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 1.0, bottom: 80.0),
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0), color: clime),
//                   child: Icon(Icons.local_shipping, color: Colors.white),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 8.0, bottom: 80.0),
//                   child: Text(
//                     "Cash Center",
//                     style: TextStyle(fontSize: 30.0),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginPage(),
//                             ));
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 40.0,
//                         decoration: BoxDecoration(
//                             color: cred,
//                             borderRadius: BorderRadius.circular(10.0)),
//                         child: Text(
//                           "Sign In With Your Credential",
//                           style: TextStyle(fontSize: 20.0, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
