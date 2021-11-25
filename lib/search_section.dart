import 'package:flutter/material.dart';
import 'package:authentification/constants.dart';
class SearchBAr extends StatelessWidget {
  const SearchBAr({
    Key key,
  }) : super(key: key);

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            // you can its giving eror user expanded widget to remove this error
            children: [
              Expanded(
                // craete containe to give background color
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          //shadow color
                            color: Colors.black38,
                            blurRadius: 4)
                      ],
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                          //remove bar
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                        )),
                  )),
              //sorting button
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.black38, blurRadius: 4)
                    ]),
                child: IconButton(
                  //create coontainer you give background color
                  onPressed: () {},
                  icon: Icon(Icons.sort_by_alpha),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

