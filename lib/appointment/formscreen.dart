import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:authentification/appointment/student.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  //เตรียม firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _appointmentCollection = FirebaseFirestore.instance.collection("appointment");

  @override
  Widget build(BuildContext context) {
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
                        Text(
                          "ชื่อ-นามสกุล",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาป้อนชื่อด้วยครับ ^^"),
                          onSaved: (String fname) {
                            myStudent.fname = fname;
                          },
                        ),
                        Text(
                          "อีเมล์",
                          style: TextStyle(fontSize: 20),
                        ),

                        TextFormField(
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

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "วันที่นัดหมาย",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาป้อนนามสกุลด้วยครับ ^^"),
                          onSaved: (String lname) {
                            myStudent.lname = lname;
                          },
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "เวลา",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาป้อนนามสกุลด้วยครับ ^^"),
                          onSaved: (String time) {
                            myStudent.time = time;
                          },
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "รายการ",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาป้อนคะแนนด้วยครับ ^^"),
                          onSaved: (String score) {
                            myStudent.score = score;
                          },
                          keyboardType: TextInputType.number,
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
                                    "lname":myStudent.lname,
                                    "email":myStudent.email,
                                    "score":myStudent.score,
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