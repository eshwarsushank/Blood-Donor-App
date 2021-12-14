import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlutterFirestore {


  Future<void> donnarSetup(String name, String district, String mobile,
      String mandal, String bloodgroup, String gender) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference donner = FirebaseFirestore.instance.collection('donner');

      // Call the user's CollectionReference to add a new user
      return donner.doc(district).collection(mandal).doc(bloodgroup).collection('list')
          .add({
        'full_name': name, // John Doe
        'mobile': mobile, // Stokes and Sons
        'gender': gender // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> donnarSearch(String distric, String mandal, String bloodgroup,String name, String mobile) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference donner = FirebaseFirestore.instance.collection('donner');
      CollectionReference personInNeed = FirebaseFirestore.instance.collection('personInNeed');

      donner.doc(distric).collection(mandal).doc(bloodgroup).collection('list')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc["full_name"]);
        });
      });

      return personInNeed
          .add({
        'full_name': name, // John Doe
        'mobile': mobile, // Stokes and Sons
        'bloodgroup': bloodgroup, // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));





    }
//dashboard
    Future<void> showRequests() async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference personInNeed = FirebaseFirestore.instance.collection('personInNeed');

      personInNeed.get()
      .then((QuerySnapshot querySnapshot){
        querySnapshot.docs.forEach((doc) {
          print(doc['full_name']);

        });

    },);



}



  }
