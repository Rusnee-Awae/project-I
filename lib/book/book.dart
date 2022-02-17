import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:authentification/appointment/display.dart';
import 'package:authentification/appointment/formscreen.dart';
import 'package:authentification/HomePage.dart';

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
      home: book(title: 'Flutter Demo Home Page'),
    );
  }
}

class book extends StatefulWidget {
  book({Key key, this.title}) : super(key: key);


  final String title;

=======
import 'package:firebase_database/firebase_database.dart';
import 'package:authentification/book/ShowDataPage.dart';

class book extends StatefulWidget {
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {
<<<<<<< HEAD

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
          ],
=======
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, profession, message,Date,lastname,Time,note,list;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Book an appointment'),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _autovalidate,
            child: FormUI(),
          ),
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======

  Widget FormUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text('Book an appointment'),

        ),
        Column(
          children: [
            new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'name'),

                    validator: validateName,
                    onSaved: (val) {
                      name = val;
                    },
                    maxLength: 32,
                  ),
                ),
                new Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'lastname'),

                    validator: validateName,
                    onSaved: (val) {
                      lastname = val;
                    },
                    maxLength: 32,
                  ),
                ),

                new SizedBox(width: 10.0),
              ],
            ),
          ],
        ),

        Column(
          children: [
            new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'Date'),

                    validator: validateName,
                    onSaved: (val) {
                      Date = val;
                    },

                  ),
                ),
                new SizedBox(width: 10.0),
              ],
            ),
          ],
        ),

        Column(
          children: [
            new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'Time'),

                    validator: validateName,
                    onSaved: (val) {
                      Time = val;
                    },

                  ),
                ),
                new SizedBox(width: 10.0),
              ],
            ),
          ],
        ),

        Column(
          children: [
            new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'list'),

                    validator: validateName,
                    onSaved: (val) {
                      list = val;
                    },

                  ),
                ),
                new SizedBox(width: 10.0),
              ],
            ),
          ],
        ),

        new TextFormField(
          decoration: new InputDecoration(hintText: 'note'),
          onSaved: (val) {
            message = val;
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        ),
        new SizedBox(height: 20.0),
        new RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ShowDataPage()));
          },
          child: new Text('Show Data'),
        )
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "name": name,
        "lastname": lastname,
        "Data": Date,
        "Time": Time,
        "list": list,
        "note": note,
        "profession": profession,
        "message": message,
      };
      ref.child('Book an appointment').push().set(data).then((v) {
        _key.currentState.reset();
      });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validateName(String val) {
    return val.length == 0 ? "Enter Name First" : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? "Enter Email First" : null;
  }
}
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
