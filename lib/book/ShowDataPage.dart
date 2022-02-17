import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:authentification/book/myData.dart';

class ShowDataPage extends StatefulWidget {
  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<myData> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
<<<<<<< HEAD
=======
    ref.child('Book an appointment').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        myData d = new myData(
          data[key]['name'],
          data[key]['lastname'],
          data[key]['Date'],
          data[key]['Time'],
          data[key]['list'],
          data[key]['note'],
          data[key]['message'],
          data[key]['profession'],

        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              return UI(
                allData[index].name,
                allData[index].lastname,
                allData[index].Date,
                allData[index].Time,
                allData[index].list,
                allData[index].note,
                allData[index].profession,
              );
            },
          )),
    );
  }

  Widget UI(String name, String profession, String message,
      String lastname, String Date, String Time, String list) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
<<<<<<< HEAD
            new Text('Name : $name',style: Theme.of(context).textTheme.subtitle1,),
=======
            new Text('Name : $name',style: Theme.of(context).textTheme.title,),
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
            new Text('Lastname : $lastname'),
            new Text('Date : $Date'),
            new Text('List : $list'),
            new Text('Profession : $profession'),
            new Text('Note : $message'),
          ],
        ),
      ),
    );
  }
}