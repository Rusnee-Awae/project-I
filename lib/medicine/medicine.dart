import 'package:authentification/medicine/animation.dart';
import 'package:authentification/medicine/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:page_transition/page_transition.dart';

class medicine extends StatefulWidget{
  @override
  _medicineState createState() => _medicineState();
}

class _medicineState extends State<medicine> with TickerProviderStateMixin {
  Color primaryColor = Color(0xFF7ddbf4);
  AnimationController translateController;
  Animation<double> translateAnimation;
  AnimationController scaleController;
  Animation<double> scaleAnimation;
  bool buttonClicked = false;
  @override
  void initState() {
    translateController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 600))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          scaleController.forward();
          setState(() {
            buttonClicked = true;
          });
        }
      });
    scaleController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: SecondPage(),
            ),
          );
        }
      });
    translateAnimation =
        Tween<double>(begin: 0, end: 240).animate(translateController);
    scaleAnimation = Tween<double>(begin: 1, end: 40).animate(scaleController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: primaryColor,
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      image: AssetImage("images/dr.jpg"),
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Text(
                      "ยาที่ใช้ทางทันตกรรม",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: Text(
                      "Drugs used in Dentistry",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    delay: 3,
                    child: Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Text(
                        " ยา เป็นปัจจัยสำคัญอย่างหนึ่งในการรักษาความเจ็บป่วย การบำบัด บรรเทาอาการ และกำจัดสาเหตุของโรค ยามีทั้งคุณและโทษในตัวเอง จึงต้องมีความระมัดระวังในการใช้ยา เพื่อให้ได้รับประโยชน์สูงสุดและให้ได้รับโทษน้อยที่สุดจากการใช้ยา",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        translateController.forward();
                      },
                      child: FadeAnimation(
                        delay: 4,
                        child: AnimatedBuilder(
                          animation: translateAnimation,
                          builder: (context, child) => Transform.translate(
                            offset: Offset(translateAnimation.value, 0),
                            child: AnimatedBuilder(
                              animation: scaleAnimation,
                              builder: (context, child) => Transform.scale(
                                scale: scaleAnimation.value,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: buttonClicked
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}