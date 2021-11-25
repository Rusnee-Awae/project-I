import 'package:flutter/material.dart';
import 'package:authentification/constants.dart';
// it is good practice and easy to find code
class CustomAppBAr extends StatelessWidget {

  const CustomAppBAr({
    Key key,
  }) : super(key: key);

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Row(
      //space between widgets
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            //appbar color
            // sorry it is not appbar color ,it is cons background color
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          //drawer icon
          //our drawer is not working now we write builder function to add functionality of drawer
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.dashboard,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                // you can see its working
              },
            ),
          ),
        ),
        // thats why we user column
        Column(
          children: [
            // login user name
            Text('Promotion'),
            //location
            Text(
              'My Dental Clinic',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        //now create avatar user profile pic
        CircleAvatar(
          backgroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}