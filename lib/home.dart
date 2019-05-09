import 'package:flutter/material.dart';
import 'package:icms_app/constants.dart';
import 'package:icms_app/evacuations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: cred),
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
                      style: TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EvacuationPage(),
                ));
          },
          child: ItemCard('Evacuation Requests', 'Expected consignment pickups',
              '3,284', [cred, cyellow]),
        ),
        SizedBox(
          height: 8.0,
        ),
        ItemCard('Accept Consignments', 'Confirm you have received bags', '',
            [cteal, clime]),
        SizedBox(
          height: 8.0,
        ),
        ItemCard('Handover Consignments', 'Handover ccosignments to Boxroom',
            '1,520', [corange, cbrown]),
        SizedBox(
          height: 32.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Stack(
            children: <Widget>[
              contactCard,
              contactThumbnail,
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Stack(
            children: <Widget>[
              contactCard2,
              contactThumbnail2,
            ],
          ),
        ),
      ],
    );
  }
}

// The contactCard, this will hold contact information
final contactCard = Container(
    height: 124.0,
    margin: EdgeInsets.only(left: 36.0),
    decoration: BoxDecoration(
        color: cbluegreyl4,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(80.0, 10.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jane Usman',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, top: 10.0),
                    child: Icon(
                      Icons.email,
                      color: cbluegrey,
                    ),
                  ),
                  Text(
                    "Send Message",
                    style: TextStyle(color: cbluegrey),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, top: 10.0),
                    child: Icon(
                      Icons.phone,
                      color: cbluegrey,
                    ),
                  ),
                  Text(
                    "+2348020665599",
                    style: TextStyle(color: cbluegrey),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));

// The Contact Thumbnail, this will hold the support person image
final contactThumbnail = Container(
  margin: EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: Image(
    image: AssetImage("assets/images/supportlady.png"),
    height: 92.0,
    width: 92.0,
  ),
);

// The contactCard, this will hold contact information
final contactCard2 = Container(
    height: 124.0,
    margin: EdgeInsets.only(left: 36.0),
    decoration: BoxDecoration(
        color: cbluegreyl4,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(80.0, 10.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'John Okokon',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, top: 10.0),
                    child: Icon(
                      Icons.email,
                      color: cbluegrey,
                    ),
                  ),
                  Text(
                    "Send Message",
                    style: TextStyle(color: cbluegrey),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, top: 10.0),
                    child: Icon(
                      Icons.phone,
                      color: cbluegrey,
                    ),
                  ),
                  Text(
                    "+2348020665588",
                    style: TextStyle(color: cbluegrey),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));

// The Contact Thumbnail, this will hold the support person image
final contactThumbnail2 = Container(
  margin: EdgeInsets.symmetric(vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: Image(
    image: AssetImage("assets/images/supportman.png"),
    height: 92.0,
    width: 92.0,
  ),
);

// This class will define all the properties for each evacuation request
class Evacuation {
  int userId;
  int id;
  String title;
  String body;

  Evacuation(this.userId, this.id, this.title, this.body);
}

// Item Cards
class ItemCard extends StatelessWidget {
  final titel;
  final subtitle;
  final value;
  final colors;
  ItemCard(this.titel, this.subtitle, this.value, this.colors);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: colors),
            borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titel,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Text(
              value,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
