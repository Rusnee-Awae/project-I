import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class orthodontic extends StatefulWidget{
  @override
  _orthodonticState createState() => _orthodonticState();
}
class _orthodonticState extends State<orthodontic>{
  @override

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
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
        }
      });
    });
  }

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