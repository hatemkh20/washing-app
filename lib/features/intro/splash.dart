import 'dart:async';

import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/intro/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context,Routes.onBoardingScreen, (route) => false,);
      // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => OnBoardingScreen(),), (route) => false,);
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
