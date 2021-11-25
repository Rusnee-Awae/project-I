//import 'dart:html';
import 'package:authentification/category/category.dart';
import 'package:authentification/custom_appBar.dart';
import 'package:authentification/products/recent_products.dart';
import 'package:authentification/search_section.dart';
import 'package:authentification/slider/slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentification/personal.dart';
import 'package:authentification/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'HomePage.dart';

class HomeBody extends StatefulWidget{
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

 class _HomeBodyState extends State<HomeBody>{
   @override
  Widget build(BuildContext context){
     return Scaffold(

       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               CustomAppBAr(),
               SizedBox(
                height: 20,
               ),
               SearchBAr(),
               SizedBox(
                 height: 20,
               ),
               ProductSlider(),
               SizedBox(
                 height: 20,
               ),
               Category(),
               SizedBox(
                 height: 20,
               ),
               Container(height:100,child: RecentProdects()),
             ],
           ),
         ),
       ),
       drawer: Drawer(),
     );
   }
 }



