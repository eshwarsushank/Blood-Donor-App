import 'package:donorfinal/Screens/LoginScreen.dart';
import 'package:donorfinal/Screens/adhome.dart';
import 'package:donorfinal/Screens/donohome.dart';
import 'package:donorfinal/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donorfinal/global.dart' as global;
import 'package:fluttertoast/fluttertoast.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> adsignIn(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Signed In");
       Navigator.push(
         context,
         MaterialPageRoute(
          builder: (context) => AdHome(),
         ),
       );
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.message,gravity:ToastGravity.TOP);
    }
  } //signIn for admin

  Future<String> signIn(
      {String email, String password, BuildContext context}) async {
    try {

      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Signed In");

      User user = FirebaseAuth.instance.currentUser;
      if( !user.emailVerified){
        Fluttertoast.showToast(msg: "Please check your email for verification ",gravity:ToastGravity.TOP);
      }
     else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DonoHome(),
          ),
        );
      }


      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.message,gravity:ToastGravity.TOP);
    }
  } //donor

  Future<String> signUp(
      {String email, String password, BuildContext context}) async {
    try {
      User user = FirebaseAuth.instance.currentUser;

      // if (user!= null && !user.emailVerified) {

    //}
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await user.sendEmailVerification();
      FlutterFirestore().donnarSetup(global.username, global.district, global.mobile, global.mandal, global.bloodgroup, global.gender);
      // if ( !user.emailVerified) {
      //   print("please check your email for verification.");
      // }
      // else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      // }
      print(global.district+global.username+global.mandal +global.gender+global.mobile+global.bloodgroup);
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.message,gravity:ToastGravity.TOP);
    }
  }

  Future<void>resetPassword({String email}) async {


    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // Future<void> verify() async {
  //   User user = FirebaseAuth.instance.currentUser;
  //   await _firebaseAuth.signOut();
  //   await user.sendEmailVerification();
  // }
}

