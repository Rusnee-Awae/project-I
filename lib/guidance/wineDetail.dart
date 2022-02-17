import 'package:flutter/material.dart';

class WineDetail extends StatefulWidget {
  final wineDetail;

  WineDetail({this.wineDetail});

  @override
  _WineDetailState createState() => _WineDetailState();
}

class _WineDetailState extends State<WineDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          children: <Widget>[
            Stack(children: [
              Container(
                height: 500.0,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 12.0,
                          spreadRadius: 7.0)
                    ]),
              ),
              Container(
                height: 350.0,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                  color: widget.wineDetail.bgColor,
                ),
              ),
              Positioned(
                top: 15.0,
                left: 10.0,
                right: 10.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //We need to tilt the image slightly
              Positioned(
                  top: 45.0,
                  left: 15.0,
                  right: 15.0,
                  child: Hero(
                      tag: widget.wineDetail.imgPath,
                      child: RotationTransition(
                          turns: AlwaysStoppedAnimation(20 / 360),
                          child: Container(
                            height: 250.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.wineDetail.imgPath))),
                          )))),
              Positioned(
                top: 375.0,
                left: 15.0,
                right: 15.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.wineDetail.title,
                                  style: TextStyle(
                                    fontFamily: 'AbrilFatFace',
                                    fontSize: 20.0,
                                  )
                              ),
                              Text(widget.wineDetail.subTitle,
                                  style: TextStyle(
                                      fontFamily: 'AbrilFatFace',
                                      fontSize: 11.0,
                                      color: Colors.grey
                                  )
                              )
                            ],
                          ),
                          Text(widget.wineDetail.price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: widget.wineDetail.bgColor
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text('ทันตแพทย์เฉพาะทางสาขาวิชาจัดฟัน จะเป็นผู้วินิจฉัย และวางแผนการรักษา ',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey
                          )
                      ),
                      Text('ถ้าควรจัดฟันควรจัดด้วยวิธีไหน ซึ่งการวิเคราะห์วินิจฉัยของทันตแพทย์ จะประกอบไปด้วยหลายขั้นตอนด้วยกัน ',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey
                          )
                      ),
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('ข้อควรปฎิบัติขณะติดเครื่องมือจัดฟัน',
                                style: TextStyle(
                                  fontFamily: 'AbrilFatFace',
                                  fontSize: 20.0,
                                )
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite,
                          color: widget.wineDetail.bgColor.withOpacity(0.5),
                          size: 22.0,
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Text('ระหว่างทำการจัดฟัน ผู้ป่วยควรดูแลทำความสะอาดฟัน และช่องปากให้ดีอย่างสม่ำเสมอ และควรใช้แปรงสีฟันสำหรับจัดฟันโดยเฉพาะสำหรับผู้ที่ติดเครื่องมือจัดฟัน เนื่องจากฟันที่ถูกติดเครื่องมือหรืออุปกรณ์จะทำความสะอาดได้ยากกว่าเดิม เพราะอาจมีเศษอาหารเข้าไปติดตามซอกฟัน หรือระหว่างฟันกับเครื่องมือจัดฟันได้ง่าย และนอกจากการแปรงฟันแล้ว ยังมีอุปกรณ์เสริมช่วยในการทำความสะอาดช่องปากและฟันสำหรับผู้จัดฟัน เช่น แปรงซอกฟัน ไหมขัดฟัน superfloss ซึ่งทันตแทพย์จัดฟันจะเป็นผู้แนะนำในการใช้อุปกรณ์เหล่านี้ภายหลังจากที่ได้ทำการติดเครื่องมือจัดฟันให้กับคนไข้',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}