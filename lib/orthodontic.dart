<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class orthodontic extends StatefulWidget{
  @override
  _orthodonticState createState() => _orthodonticState();
}
class _orthodonticState extends State<orthodontic>{
  @override

=======
import 'package:authentification/models/Promotion.dart';
import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authentification/unility/my_style.dart';

class orthodontic extends StatefulWidget {
  @override
  _orthodonticState createState() => _orthodonticState();
}

class _orthodonticState extends State<orthodontic> {
  List<Widget> widgets = [];

  @override
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    var Firebase;
    await Firebase.initializeApp((value) async {
      print('initialize Success ');
      await FirebaseFirestore.instance
          .collection('Promotion')
<<<<<<< HEAD
=======
          .orderBy('name')
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
<<<<<<< HEAD
=======
          Promotion model = Promotion.fromMap(map);
          print('name = ${model.name}');
          setState(() {
            widgets.add(creatWidget(model));
          });
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
        }
      });
    });
  }

<<<<<<< HEAD
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
        ),
        body: Center(
          child: Text(
            'Hello ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
=======
  Widget creatWidget(Promotion model) => Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.network(model.cover),
              ),
              Mystyle().titleH2(model.name),
            ],
          ),
        ),
      );

  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(maxCrossAxisExtent: 200, children: widgets),
    );
  }
}

class Mystyle {
  titleH2(String name) {}
}
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
