import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:icms_app/constants.dart';

class EvacuationPage extends StatefulWidget {
  @override
  _EvacuationPageState createState() => _EvacuationPageState();
}

class _EvacuationPageState extends State<EvacuationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.save),
      //   backgroundColor: cred,
      //   onPressed: () {

      //   },
      // ),
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text('Evacuation Requests'),
        backgroundColor: cred,
        elevation: 6.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  Future<List<Evacuation>> _getEvacuations() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/posts");

    // Convert http requested data to equivalent json data object using the convert package
    var jsonData = json.decode(data.body);

    List<Evacuation> evacautions = [];

    for (var e in jsonData) {
      Evacuation evacuation =
          Evacuation(e['userId'], e['id'], e['title'], e['body']);

      // Insert the evacuation object into the evacuations array
      evacautions.add(evacuation);
    }

    print(evacautions.length);

    return evacautions;
  }

  bool checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getEvacuations(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int id) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cbluegreyl4,
                    child: Text(snapshot.data[id].title[0]),
                  ),
                  title: Text(snapshot.data[id].title),
                  subtitle: Text('The evacuation request date is here'),
                  dense: true,
                  trailing: Icon(Icons.confirmation_number),
                  onTap: () {
                    // Do Something
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

}

// This class will define all the properties for each evacuation request
class Evacuation {
  int userId;
  int id;
  String title;
  String body;

  Evacuation(this.userId, this.id, this.title, this.body);
}
