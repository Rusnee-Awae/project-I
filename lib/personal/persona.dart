import 'package:flutter/material.dart';
class persona extends StatefulWidget{
  @override
  _personaState createState() => _personaState();
}

class _personaState extends State<persona>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
        ),

        body: Center(
          child: Text(
            'Hello Flutter ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
