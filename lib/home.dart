import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xFFAF0000),
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
           _bottomNavIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.local_shipping)
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.beenhere)
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.transfer_within_a_station)
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.settings_power)
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFFAF0000)),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 24.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFFAF0000)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.local_shipping, color: Colors.white),
                              Text(
                                "Evacuation Requests",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 100.0,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF827717),
                                      borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.beenhere, color: Colors.white,),
                                        ),
                                        Text(
                                          "Accept Bags",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00838f),
                                    borderRadius: BorderRadius.circular(5.0)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.transfer_within_a_station, color: Colors.white,),
                                      ),
                                      Text(
                                        "Handover Bags",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "AWAITING REQUESTS",
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "VIEW ALL",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFFAF0000)
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}