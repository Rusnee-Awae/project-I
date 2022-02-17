import 'package:cloud_firestore/cloud_firestore.dart';


class ReviewService{
  getLatestReview(String clientName, String clientContact){
    return FirebaseFirestore.instance
        .collection('Profile')
        .where('clientName',isEqualTo: clientName)
        .where('clientContact',isEqualTo: clientContact)
        .orderBy('timeStamp',descending: true)
        .snapshots();
  }
}