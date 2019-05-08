import 'package:flutter/material.dart';

class StackedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFFAF0000)),
          child: Icon(Icons.home, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(right: 50.0, top: 50.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFF00838f)),
          child: Icon(Icons.attach_money, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.0, top: 50.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFF6a1b9a)),
          child: Icon(Icons.airport_shuttle, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(left: 90.0, top: 20.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFF37474f)),
          child: Icon(Icons.place, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(left: 70.0, bottom: 60.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFFbf360c)),
          child: Icon(Icons.business_center, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(left: 1.0, bottom: 80.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Color(0xFF827717)),
          child: Icon(Icons.local_shipping, color: Colors.white),
        ),
      ],
    );
  }
}
