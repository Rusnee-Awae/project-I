//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:authentification/personal.dart';
import 'package:authentification/constants.dart';
import 'HomePage.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // ทำให้มันอยู่ตรงกลาง
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage()), //กดlinkหน้า
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            Text('Umar'),
            Text(
              'lonirgkf , ppfp',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: kPrimaryColor,
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              row,
              Column(
                children: [CustomAppBAr()],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBAr() {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 4)],
          ),
          child: TextField(
              decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search),
          )),
        )),
        SizedBox(
          width: 10,
        ),
        Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 4)]),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort_by_alpha),
            ))
      ],
    );
  }
}
