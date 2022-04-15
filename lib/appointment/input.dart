import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myinput extends StatelessWidget{
 final String title;
 final String hint;
 final TextEditingController controller;
 final Widget widget;

 const Myinput({Key key,
    this.title,
    this.hint,
    this.controller,
    this.widget,
 }) : super (key: key);


  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Container(
        height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            color: Colors.grey,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null? false:true,
                    autofocus: false,
                    cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hint,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor
                        )

                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor
                          )

                      ),
                    ),
                  ),
                ),
                widget==null?Container(): Container(child: widget)
              ],
            ),
          ),
          Myinput(title: "Title",hint: "enter your title",)
        ],
      ),
    );
  }
}