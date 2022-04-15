import 'package:flutter/material.dart';
import 'package:authentification/appointment/display.dart';
import 'package:authentification/appointment/formscreen.dart';
import 'package:authentification/HomePage.dart';
import 'package:firebase_database/firebase_database.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


class book extends StatefulWidget {
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            FormScreen(),
            DisplayScreen()
          ],
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: "นัดหมายแพทย์",),
            Tab(text: "ตรวจสอบสถานะ",)
          ])));
}
}

