import 'dart:io';
import 'package:authentification/payment/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image;
  Storage _storage = new Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload one image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 140,
                width: 180,
                color: Colors.black12,
                child: image == null
                    ? Icon(
                  Icons.image,
                  size: 50,
                )
                    : Image.file(
                  image,
                  fit: BoxFit.fill,
                )),
            ElevatedButton(
                child: Text('pick image'),
                onPressed: () {
                  _storage.getImage(context).then((file) {
                    setState(() {
                      image = File(file.path);
                      print(file.path);
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}