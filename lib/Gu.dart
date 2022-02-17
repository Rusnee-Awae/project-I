import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'gridDashboard.dart';

class Gu extends StatefulWidget{
  @override
  _GuState createState() => _GuState();
}
<<<<<<< HEAD
=======

>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
class _GuState extends State<Gu>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
        ),
<<<<<<< HEAD
        body: Center(
          child: Text(
            'Hello Flutter World',
=======

        body: Center(
          child: Text(
            'Hello Flutter ',
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
        ),
      ),
    );
  }
  }
