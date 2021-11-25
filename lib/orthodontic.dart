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
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          Promotion model = Promotion.fromMap(map);
          print('name = ${model.name}');
          setState(() {
            widgets.add(creatWidget(model));
          });
        }
      });
    });
  }

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
