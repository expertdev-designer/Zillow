import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zillow1/registration/register_email_screen.dart';
import 'package:zillow1/registration/welcome_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Image.asset("assets/images/androidlogo.png",
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}