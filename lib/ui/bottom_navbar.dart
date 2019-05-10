import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon:Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon:Icon(Icons.local_shipping),
              onPressed: () {},
            ),IconButton(
              icon:Icon(Icons.beenhere),
              onPressed: () {},
            ),
            IconButton(
              icon:Icon(Icons.transfer_within_a_station),
              onPressed: () {},
            ) 
          ],
        ),
      );
  }
}