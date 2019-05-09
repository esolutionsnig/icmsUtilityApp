import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

var cred = Color(0xFFAF0000);
var cteal = Color(0xFF00838f);
var cpurple = Color(0xFF6a1b9a);
var cgrey = Color(0xFF37474f);
var corange = Color(0xFFbf360c);
var clime = Color(0xFF827717);
var cpink = Color(0xFF880e4f);
var cblue = Color(0xFF0d47a1);
var ccyan = Color(0xFF0097a7);
var cgreen = Color(0xFF2e7d32);
var cyellow = Color(0xFFf9a825);
var camber = Color(0xFFff8f00);
var cbrown = Color(0xFF3e2723);
var cbluegrey = Color(0xFF37474f);
var cbluegreyl4 = Color(0xFFeceff1);

class _BottomNavBarState extends State<BottomNavBar> {

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: cred,
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
           _bottomNavIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text('Requests'),
            icon: Icon(Icons.local_shipping)
          ),
          BottomNavigationBarItem(
            title: Text('Accept Bag'),
            icon: Icon(Icons.beenhere)
          ),
          BottomNavigationBarItem(
            title: Text('Handover'),
            icon: Icon(Icons.transfer_within_a_station)
          ),
          BottomNavigationBarItem(
            title: Text('Sign Out'),
            icon: Icon(Icons.settings_power)
          )
        ],
      );
  }
}