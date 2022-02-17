
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
                height: 400,
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
                                  padding:const EdgeInsets.all(10.0),
                                  child:Column(
                                      children: <Widget>[
                                        Container(color: Colors.pink, padding: EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                Text( 'Patient History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Text( 'ชื่อ-นามสกุล :${data.docs[index]['ชื่อ-นามสกุล']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'น้ำหนัก :${data.docs[index]['น้ำหนัก']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'เพศ :${data.docs[index]['เพศ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'อายุ :${data.docs[index]['อายุ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'กรุ๊ปเลือด :${data.docs[index]['กรุ๊ปเลือด']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'ส่วนสูง :${data.docs[index]['ส่วนสูง']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'น้ำหนัก :${data.docs[index]['น้ำหนัก']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'แพ้ยา :${data.docs[index]['แพ้ยา']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'โรคประจำตัว :${data.docs[index]['โรคประจำตัว']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),

                                        Container(color: Colors.white, padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget> [


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
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
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
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/todo1.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 250, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
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