// ignore_for_file: deprecated_member_use, unnecessary_statements, unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:authentification/appointment/student.dart';

import 'package:form_field_validator/form_field_validator.dart';

class FormScreen extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget widget;
  const FormScreen({Key key, this.title, this.hint, this.controller, this.widget}) :
        super(key: key);


  @override
  _FormScreenState createState() => _FormScreenState();

  }

class _FormScreenState extends State<FormScreen> {

  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  //เตรียม firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _appointmentCollection = FirebaseFirestore.instance.collection("appointment");

  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;
   void loadData(){
     listDrop = [];
   listDrop.add(new DropdownMenuItem(
     child: new Text('Tooth filling'),
     value: 'Tooth filling',
   ));
     listDrop.add(new DropdownMenuItem(
       child: new Text('change tire'),
       value: 'change tire',
     ));

 }
  @override
  Widget build(BuildContext context) {
     DateTime _dateTime = DateTime.now();
     loadData();
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Book an Appointment"),
              ),


              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "นัดหมายแพทย์ออนไลน์",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "ชื่อ-นามสกุล",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนชื่อด้วยครับ ^^"),
                            onSaved: (String fname) {
                              myStudent.fname = fname;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "อีเมล์",
                          style: TextStyle(fontSize: 20),
                        ),

                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                          child: TextFormField(
                            validator: MultiValidator([
                              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                              RequiredValidator(
                                  errorText: "กรุณาป้อนอีเมลด้วยครับ ^^")
                            ]),
                            onSaved: (String email) {
                              myStudent.email = email;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "วันที่นัดหมาย",
                          style: TextStyle(fontSize: 20),
                        ),

                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนชื่อด้วยครับ ^^"),
                            onSaved: (String dateTime) {
                              myStudent.dateTime = dateTime;
                            },
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "เวลา",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนนามสกุลด้วยครับ ^^"),
                            onSaved: (String time) {
                              myStudent.time = time;
                            },
                          ),
                        ),


                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "รายการ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                          child: new Center(
                            child: new DropdownButton(
                              value: selected,
                              items: listDrop,
                              hint: new Text('Select Item'),
                              iconSize: 60,
                              iconDisabledColor: Colors.pink,
                              onChanged: (String list) {
                                selected = myStudent.list = list;
                                setState(() {
                                });}
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              child: Text(
                                "บันทึก",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async{
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                    await _appointmentCollection.add({
                                    "fname":myStudent.fname,
                                    "dateTime":myStudent.dateTime,
                                    "email":myStudent.email,
                                    "list":myStudent.list,
                                      "time":myStudent.time

                                  });
                                  formKey.currentState.reset();
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}