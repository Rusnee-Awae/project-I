import 'package:authentification/constants.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    // Wrap categoryProducts with Listview to add scroll and scrol direction
    //height is missing ,add height
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryProducts(
            press: () {},
            //image path
            image: 'images/jad.jpg',
            text: 'จัดฟัน',
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProducts(
            press: () {},
            //image path
            image: 'images/au.jpg',
            text: 'อุดฟัน',
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProducts(
            press: () {},
            //image path
            image: 'images/t.jpg',
            text: 'ถอนฟัน',
          ),
          SizedBox(
            width: 20,
          ),
          CategoryProducts(
            press: () {},
            //image path
            image: 'images/rak.jpg',
            text: 'การรักษารากฟัน',
          ),
        ],
      ),
    );
  }
}
class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    Key key,
    @required this.image,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback press;

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          //chip widget user
          child: Chip(
              backgroundColor: kPrimaryColor,
              label: Row(
                children: [
                  Image.asset(
                    image,
                    height: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(text),
                ],
              )),
        ),
      ),
    );
  }
}