
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  CollectionReference Profile = FirebaseFirestore.instance.collection("Profile");
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 680,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder(stream: Profile.snapshots(),
                    builder: (context, snapshot) {

                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index){

                          return
                            Container(

                              child: Padding(
                                  padding:const EdgeInsets.all(9.0),
                                  child:Column(
                                      children: <Widget>[
                                        Container(color: Colors.cyan, padding: EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Text ( 'Patient History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'ชื่อ-นามสกุล :${data.docs[index]['ชื่อ-นามสกุล']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'น้ำหนัก :${data.docs[index]['น้ำหนัก']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'เพศ :${data.docs[index]['เพศ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              Text( 'อายุ :${data.docs[index]['อายุ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'กรุ๊ปเลือด :${data.docs[index]['กรุ๊ปเลือด']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'ส่วนสูง :${data.docs[index]['ส่วนสูง']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'น้ำหนัก :${data.docs[index]['น้ำหนัก']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'แพ้ยา :${data.docs[index]['แพ้ยา']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text( 'โรคประจำตัว :${data.docs[index]['โรคประจำตัว']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(color: Colors.white, padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget> [


                                              ],
                                            ),
                                        ),

                                        Container(color: Colors.cyan, padding: EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Text( 'Treatment history',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'ทันตกรรมจัดฟัน :${data.docs[index]['ทันตกรรมจัดฟัน']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'ค่าใช้จ่ายตลอดการรักษา :${data.docs[index]['ค่าใช้จ่ายตลอดการรักษา']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'เดือน :${data.docs[index]['เดือน']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'จำนวนเงินชำระ :${data.docs[index]['จำนวนเงินชำระ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text( 'ยอกชำระคงเหลือ :${data.docs[index]['ยอกชำระคงเหลือ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),




                                      ]

                                  ),
                                ),
                              );

                        },
                      );
                    }

              )
              )],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width / 2, 200, size.width, 100)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}