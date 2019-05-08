import 'package:flutter/material.dart';

import 'package:icms_app/stacked_icons.dart';
import 'package:icms_app/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFFAF0000)),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StackedIcons(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 60.0),
                      child: Text(
                        "Cash Center",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 5.0, top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFAF0000),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 17.0, color: Color(0xFFAF0000)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 18.0),
                //         child: Text(
                //           "Create A New Account",
                //           style:
                //               TextStyle(fontSize: 17.0, color: Color(0xFFAF0000)),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
