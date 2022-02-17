<<<<<<< HEAD

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  CollectionReference Payment = FirebaseFirestore.instance.collection("Payment");
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
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 18),

                  child: StreamBuilder(stream: Payment.snapshots(),
                      builder: (context, snapshot) {

                        final data = snapshot.requireData;
                        return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index){

                            return
                              Container(

                                child: Padding(
                                  padding:const EdgeInsets.all(15.0),
                                  child:Column(
                                      children: <Widget>[

                                        Row(
                                          children: [
                                            Text( 'ชื่อคนไข้ :${data.docs[index]['ชื่อคนไข้']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'แพทย์ :${data.docs[index]['แพทย์']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'Date :${data.docs[index]['Date']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'รายการ :${data.docs[index]['รายการ']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'Monthly orthodontist fee :${data.docs[index]['Monthly orthodontist fee']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( 'next payment :${data.docs[index]['next payment']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( ' Total :${data.docs[index]['Total']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text( ' ผู้รับเงิน :${data.docs[index]['ผู้รับเงิน']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                            ),
                                          ],
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
                padding: EdgeInsets.all(1),
                child: Text(
                  "Receipt",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/setting.png'),
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
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  const payment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Payment").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong "),);
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Loading"),
          );
        }

        if(snapshot.hasData){}
        return CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Payment"),
            ),
           // SliverList(
             // delegate: SliverChildListDelegate(
            //  snapshot.data!.docs.map((DocumentSnapshot document){
              //  Map<String, dynamic > data = document.data()!;

               // return CupertinoListTile(

                //    title: Text(data['title']),
                //    );
            //  }).toList()))
          ],
        );
    }
  );
  }
}
>>>>>>> 024f99e7b12d1ffa204bc4664e283375523f29a3
