import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:donorfinal/routes.dart';

import 'OpenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: AppRoutes.define(),
      home: Container(
        child: AnimatedSplashScreen(
          splashIconSize: 200,
          duration: 3000,
          splash: Container(
            child: Image.asset(
              'assets/images/applogo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          nextScreen:OpenView(),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRight,
        ),
      ),
    );
  }
}