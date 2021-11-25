import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  const payment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Payment").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong "),);
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Loading"),
          );
        }

        if(snapshot.hasData){}
        return CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Payment"),
            ),
           // SliverList(
             // delegate: SliverChildListDelegate(
            //  snapshot.data!.docs.map((DocumentSnapshot document){
              //  Map<String, dynamic > data = document.data()!;

               // return CupertinoListTile(

                //    title: Text(data['title']),
                //    );
            //  }).toList()))
          ],
        );
    }
  );
  }
}
