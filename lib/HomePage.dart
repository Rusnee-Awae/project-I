import 'dart:ffi';
import 'package:authentification/book/book.dart';
import 'package:authentification/guidance/main.dart';
import 'package:authentification/medicine/medicine.dart';
import 'package:authentification/medicine/secondPage.dart';
import 'package:authentification/op/explore.dart';
import 'package:authentification/payment/payment.dart';
import 'package:authentification/personal/home_page.dart';
import 'package:authentification/personal/profilepage.dart';
import 'package:authentification/personal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'gridDashboard.dart';
import 'package:authentification/Gu.dart';
import 'package:authentification/personal/persona.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    var firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  Items item1 = new Items(
      title: "personal record",
      subtitle: "ประวัติส่วนตัวและการรักษา",
      event: "3 Events",
      img: "images/calendar.png");

  Items item2 = new Items(
    title: "Orthodontic promotion",
    subtitle: "โปรโมชั่นการจัดฟัน",
    event: "4 Items",
    img: "images/food.png",
  );
  Items item3 = new Items(
    title: "Book an appointment",
    subtitle: "นัดหมายแพทย์",
    event: "",
    img: "images/map.jpg",
  );
  Items item4 = new Items(
    title: "Guidance",
    subtitle: "คำแนะนำคลินิก",
    event: "",
    img: "images/todo1.jpg",
  );
  Items item5 = new Items(
    title: "Medicine",
    subtitle: "ยา",
    event: "4 Items",
    img: "images/todo.png",
  );
  Items item6 = new Items(
    title: "Payment",
    subtitle: "ชำระเงิน",
    event: "2 Items",
    img: "images/setting.png",
  );

  @override
  void initState() {
    super.initState();

    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      ],
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      onPressed: signOut,
                      child: Text('Signout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                child: GridView.count(
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),

                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/calendar.png", width: 42),
                          SizedBox(height: 14),
                          Text(
                            "personal record",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "ประวัติส่วนตัวและการรักษา",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                    builder: (context) => ProfilePage()),

                              );
                            },
                            child: Text('Go to 1 !'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/food.png", width: 42),
                          SizedBox(height: 14),
                          Text(
                            "Orthodontic promotion",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "โปรโมขั่นการจัดฟัน",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                    builder: (context) =>Explore()), //กดlinkหน้า
                                     //กดlinkหน้า

                              );
                            },
                            child: Text('Go to 2 !'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),


              Flexible(
                child: GridView.count(
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/map.jpg", width: 45),
                          SizedBox(height: 14),
                          Text(
                            "Book an appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "นัดหมายแพทย์",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => book()), //กดlinkหน้า
                              );
                            },
                            child: Text('Go to 3 !'),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/todo1.jpg", width: 42),
                          SizedBox(height: 14),
                          Text(
                            "Guidance",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "คำแนะนำคลินิก",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                    builder: (context) => MyHomePage()), //กดlinkหน้า
                                //กดlinkหน้า
                              );
                            },
                            child: Text('Go to 4 !'),
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),

              Flexible(
                child: GridView.count(
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/todo.png", width: 42),
                          SizedBox(height: 14),
                          Text(
                            "Medicine",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "ยา",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage2()), //กดlinkหน้า
                              );
                            },
                            child: Text('Go to 5 !'),
                          ),
                        ],
                      ),

                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Color(color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/setting.png", width: 42),
                          SizedBox(height: 14),
                          Text(
                            "Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "ชำระเงิน",
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate back to first route when tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => payment()), //กดlinkหน้า
                              );
                            },
                            child: Text('Go to 6 !'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
class treeRoute extends StatelessWidget {
  @override
  const treeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Items item1 = new Items(
        title: "personal record",
        subtitle: "ประวัติส่วนตัวและการรักษา",
        event: "3 Events",
        img: "images/calendar.png");

    @override
    Widget showlogo() {
      return Container(
        child: Image.asset('images/calendar.png'),
        height: 100.0,
        width: 200.0,
        color: Colors.blue[50],
      );
    }

    @override
    Widget showlogo1() {
      return Container(
        child: Image.asset('images/setting.png'),
        height: 100.0,
        width: 200.0,
        color: Colors.blue[50],
      );
    }

    @override
    Widget showlogo2() {
      return Container(
        child: Image.asset('images/setting.png'),
        height: 100.0,
        width: 200.0,
        color: Colors.blue[50],
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("dental services"),
        ),
        body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showlogo(),
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TirRoute()), //กดlinkหน้า
                      );
                    },
                    child: Text('จัดฟัน',
                      style: TextStyle(
                        fontSize: 20.0,color: Colors.white,

                      ),),
                  ),
                ),

                showlogo1(),
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => oneRoute()), //กดlinkหน้า
                      );
                    },
                    child: Text('ขุดหินปูน'),
                  ),
                ),

                showlogo(),
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => twoRoute()), //กดlinkหน้า
                      );
                    },
                    child: Text('ผ่าฟันคุด'),
                  ),
                ),


                showlogo2(),
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()), //กดlinkหน้า
                      );
                    },
                    child: Text('อุดฟัน'),
                  ),
                ),
              ],
            )

        )


    );
  }
}

class TirRoute extends StatelessWidget {
  const TirRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental care"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('จัดฟัน'),
            ),
            Container(
              width: 1000.0,
              height: 200.0,
              child: Image.network(
                  'https://thailanddentalclinic.com/wp-content/uploads/2020/10/braces.jpg'),
              color: Colors.pinkAccent,
            ),
            Text(
                'จัดฟัน เป็นการรักษาทางทันตกรรมแขนงหนึ่ง ซึ่งรักษาเกี่ยวกับการแก้ไขการเรียงตัวของฟัน เช่น ฟันซ้อนเก ฟันยื่น ฟันห่าง ฟันล่างคร่อมฟันบน เป็นต้น และนอกจากการแก้ไขการเรียงตัวของฟันแล้ว การจัดฟันก็สามารถช่วยแก้ไข หรือปรับปรุงระบบการบดเคี้ยวของคุณให้เป็นปกติอีกด้วย ซึ่งการรักษาด้วยวิธีการจัดฟัน ควรจะทำภายใต้การรักษาของทันตแพทย์เฉพาะสาขาวิชาจัดฟัน '),
            Container(
              child: Text('เคสตัวอย่าง ก่อนและหลัง จัดฟัน'),
            ),

            Container(
              width: 1000.0,
              height: 200.0,
              child: Image.network(
                  'https://cdn.statically.io/img/www.plusdentalclinic.com/wp-content/uploads/2020/09/06-2.jpg?quality=100&f=auto'),
            ),
          ],
        ),
      ),
    );
  }
}

class oneRoute extends StatelessWidget {
  const oneRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental care"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'การจัดฟัน',
            ),
            Image.network(
                'https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img,w_1200/https://smiledc-th.com/wp-content/uploads/2021/02/Scaling.jpg'),
            Text(
                'การอุดฟัน เป็นการรักษาทางทันตกรรมอย่างหนึ่ง เป็นวิธีที่ทันตแพทย์มักจะให้คำแนะนำสำหรับผู้ที่มีปัญหาฟันผุ ฟันแตกหรือฟันบิ่น ฟันสึก หรือฟันกร่อน เพื่อป้องกันไม่ให้รอยโรคนั้นลุกลามไปมากกว่าเดิมที่เป็นอยู่ และยังเป็นการคงสภาพฟันซี่ข้างเคียงให้สวยงาม และใช้งานได้ตามปกติเหมือนเดิม'),
            Text('เคสตัวอย่าง ก่อนและหลัง จัดฟัน'),
            Image.network(
                'https://image.makewebeasy.net/makeweb/0/NsIbTowx9/contentknowledge760x760/%E0%B8%82%E0%B8%B9%E0%B8%94%E0%B8%AB%E0%B8%B4%E0%B8%99%E0%B8%9B%E0%B8%B9%E0%B8%99.png'),
          ],
        ),
      ),
    );
  }
}

class twoRoute extends StatelessWidget {
  const twoRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental care"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'การผ่าฟันคุด',
            ),
            Container(
              width: 1500.0,
              height: 200.0,
              child: Image.network(
                  'https://www.skytraindental.com/wp-content/uploads/2016/09/06-%E0%B8%9C%E0%B9%88%E0%B8%B2%E0%B8%9F%E0%B8%B1%E0%B8%99%E0%B8%84%E0%B8%B8%E0%B8%94.jpg'),
            ),
            Text(
                'ฟันคุด คือ ฟันที่ไม่สามารถขึ้นได้เต็มที่ตามปกติ โดยมากมักจะเป็นในฟันกรามซี่สุดท้าย สามารถพบได้ทั้งฟันบน และฟันล่าง แต่ส่วนมากฟันล่างจะมีโอกาสพบว่าเป็นฟันคุดได้มากกว่า'),
            Text('เคสตัวอย่าง ก่อนและหลัง จัดฟัน'),
            Container(
              width: 1500.0,
              height: 200.0,
              child: Image.network(
                  'https://f.btwcdn.com/store-42794/product/aec9dcaa-47ff-e9c2-07aa-5b763cafe624.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}



