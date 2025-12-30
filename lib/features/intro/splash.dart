import 'dart:async';
import 'dart:developer';

import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/intro/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../core/local/flutter_secure_manager.dart';
import '../../core/local/shared_prefs_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

void skipMethod ()async{
  var skipVar  = await SharedPrefsManager.getData(key: "skip");

  if(skipVar != null){
    Navigator.pushNamedAndRemoveUntil(context,Routes.mainScreen, (route) => false,);
  }else {
    checkIntro();
  }
}
  void checkIntro()async{
    var intro = await FlutterSecureManager.readData(key: "onBoard");

    if(intro != null){
      checkLogin();
    }else {
      Navigator.pushNamedAndRemoveUntil(context,Routes.onBoardingScreen, (route) => false,);
    }
  }

  void checkLogin()async{
    var token = await FlutterSecureManager.readData(key: "token");
    log(token.toString());
    if(token != null){
      Navigator.pushNamedAndRemoveUntil(context,Routes.mainScreen, (route) => false,);
    }else {
      Navigator.pushNamedAndRemoveUntil(context,Routes.loginScreen, (route) => false,);
    }
  }
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      // Navigator.pushNamedAndRemoveUntil(context,Routes.onBoardingScreen, (route) => false,);
      // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => OnBoardingScreen(),), (route) => false,);
      skipMethod();
      // checkLogin();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : AppColor.primaryLightColor,
      body: Image.asset(ImageApp.logo2).center,
    );
  }
}
