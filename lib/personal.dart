import 'package:flutter/material.dart';
import 'package:authentification/HomePage.dart';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'gridDashboard.dart';
import 'package:authentification/home_body.dart';

class personal extends StatefulWidget {
  @override
  _personalState createState() => _personalState();
}

class _personalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,


      body: HomeBody(),
    );
  }
}
