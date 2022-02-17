import 'package:flutter/material.dart';

class Wine {
  String price;
  String title;
  String subTitle;
  String imgPath;
  Color bgColor;
  int rating;

  Wine(
      {this.price,
        this.title,
        this.subTitle,
        this.imgPath,
        this.bgColor,
        this.rating});
}

var wines = [
  Wine(
      price: '\1299 Bath',
      title: 'การจัดฟัน',
      subTitle: 'ข้อบ่งชี้ของผู้ที่ควรเข้ารับการรักษาจัดฟัน',
      imgPath: 'assets/a.jpg',
      bgColor: Color(0xFFFECBC2),
      rating: 5),
  Wine(
      price: '\ 999 Bath',
      title: 'การขูดหินปูน ',
      subTitle: 'เพื่อรักษาโรคเหงือกอักเสบ',
      imgPath: 'assets/b.jpg',
      bgColor: Color(0xFFB4E8EB),
      rating: 4),
];

var recommendWines = [
  Wine(
      price: '\49 Bath',
      title: 'การผ่าฟันคุด',
      subTitle: 'ขั้นตอนการผ่าฟันคุด',
      imgPath: 'assets/c.jpg',
      bgColor: Color(0xFF6CD7DC),
      rating: 5),
  Wine(
      price: '\669 Bath',
      title: 'การทำสะพานฟัน',
      subTitle: 'การทำสะพานฟันเหมาะกับใคร',
      imgPath: 'assets/d.jpg',
      bgColor: Color(0xFFF28E90),
      rating: 4),
];


