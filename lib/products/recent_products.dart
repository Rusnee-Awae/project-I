import 'package:authentification/constants.dart';
import 'package:flutter/material.dart';

class RecentProdects extends StatelessWidget {
  //we create here product list and i am already create and you can create it as give below
  final productList = [
    {
      'name': 'โปรโมชั่นจัดฟัน',
      'image': 'images/pen.jpg',
      'price': 35000,
      'disc': 'Material: Georgette; Comfortable and Breathable to wear',
    },
    {
      'name': 'โปรโมชั่นฟอกสีฟันด้วยแสงเย็น',
      'image': 'images/poo.jpg',
      'price': 4500,
      'disc': 'Material: Georgette; Comfortable and Breathable to wear'
    },
    {
      'name': 'โปรโมชั่นฟอกสีฟันเลเซอร์',
      'image': 'images/poo1.jpg',
      'price': 6800,
      'disc': 'Material: Georgette; Comfortable and Breathable to wear'
    },
    {
      'name': 'peach Shirt',
      'image': 'images/jpg',
      'price': 2900,
      'disc': 'Material: Georgette; Comfortable and Breathable to wear'
    },

  ];
  @override
  Widget build(BuildContext context) {
    // now we create grid how colums of products we want to show
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.70),
        itemBuilder: (BuildContext context, int index) {
          //we assign values to this variables
          return RecentSignleProducts(
            recent_signle_prod_disc: productList[index]['disc'],
            recent_signle_prod_name: productList[index]['name'],
            recent_signle_prod_image: productList[index]['image'],
            recent_signle_prod_price: productList[index]['price'],
          );
        });

  }
}
// now create another class
// convert it into statefull Widget
class RecentSignleProducts extends StatefulWidget {
  final recent_signle_prod_name;
  final recent_signle_prod_image;
  final recent_signle_prod_price;
  final recent_signle_prod_disc;
  RecentSignleProducts({
    this.recent_signle_prod_name,
    this.recent_signle_prod_image,
    this.recent_signle_prod_price,
    this.recent_signle_prod_disc,
  });

  @override
  _RecentSignleProductsState createState() => _RecentSignleProductsState();
}
class _RecentSignleProductsState extends State<RecentSignleProducts> {
  bool isLike = false;
  final Color inactiveColor = Colors.black38;

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kPrimaryColor,
          ),
          child: Image.asset(widget.recent_signle_prod_image),
          //we are facing error to solve it we have to give height of container in home_body file and line number 24
        ),
        ListTile(
            title: Text(widget.recent_signle_prod_name),
            subtitle: Text('\$${widget.recent_signle_prod_price}'),
            // we user trailling widget to create favourite icon
            trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                icon: Icon(
                  isLike ? Icons.favorite : Icons.favorite_border_outlined,
                  color: isLike ? Colors.red : inactiveColor,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
              ),
            ))
      ],
    );
  }
}