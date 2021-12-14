import 'package:donorfinal/Screens/AdminLogin.dart';
import 'package:donorfinal/Screens/AdminSignup.dart';
import 'package:donorfinal/Screens/admindonorview.dart';
import 'package:donorfinal/Screens/adresults.dart';
import 'package:donorfinal/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:donorfinal/Screens/OpenView.dart';
import 'package:donorfinal/Screens/LoginScreen.dart';
import 'package:donorfinal/Screens/Registration.dart';
import 'package:donorfinal/Screens/search.dart';
import 'package:donorfinal/Screens/donohome.dart';
import 'package:donorfinal/Screens/donordisplay.dart';
import 'package:donorfinal/Screens/adhome.dart';
import 'package:donorfinal/Screens/getCertificate.dart';




class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String menu = '/menu';
  static const String dash = '/dash';
  static const String search = '/search';
  static const String donor = '/donor';
  static const String about = '/About';
  static const String profile = '/Profile';
  static const String dohome = '/donohome';
  static const String result='/donordisplay';
  static const String adhome='/adhome';
  static const String ucert='/getCertificate';
  static const String dresult='/adresults';
  static const String addonor='/admindonorview';
  static const String admin='/AdminLogin';
  static const String adminsign='/AdminSignup';
  

  static Map<String, WidgetBuilder> define() {
    return {
      menu: (context) => OpenView(),
      donor: (context) => LoginView(),
       authRegister: (context) => RegisterView(),
       authLogin: (context) => LoginView(),
        search: (context) => Search(),
        dohome:(context)=>DonoHome(),
        dash:(context)=>Dash(),
        result:(context)=>DDash(),
        adhome:(context)=>AdHome(),
        ucert:(context)=>Certificate(),
        dresult:(context)=>AdDDash(),
        addonor:(context)=>AdSearch(),
        admin:(context)=>AdLoginView(),
      adminsign:(context)=>AdRegisterView(),

     
    };
  }
}
