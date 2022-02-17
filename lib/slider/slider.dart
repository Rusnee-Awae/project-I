import 'package:carousel_pro/carousel_pro.dart';
import 'package:authentification/constants.dart';
import 'package:flutter/material.dart';

//create statefull widget
class ProductSlider extends StatefulWidget {
  @override
  _ProductSliderState createState() => _ProductSliderState();
}
class _ProductSliderState extends State<ProductSlider> {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //error is showing beacuse not give height
        height: 200,
        child: Carousel(
          images: [
            //image path
            //we user wrong widge
            AssetImage('images/c.jpg'),
            AssetImage('images/pen.jpg'),
            AssetImage('images/b.jpg'),
            AssetImage('images/poo.jpg'),
            AssetImage('images/poo1.jpg'),
          ],
          borderRadius: true,
          radius: Radius.circular(30),
          dotBgColor: Colors.transparent,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }
}