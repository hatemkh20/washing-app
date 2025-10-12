import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

class RequestIsProcessScreen extends StatelessWidget {
  const RequestIsProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 30.0,
              children: [
                Image.asset(ImageApp.requestProcess),
                Text(
                  "جاري فحص  طلبك فالمغسلة وسيتم اشعارك فور الانتهاء",
                  textAlign: TextAlign.center,
                  style: getBoldStyle(color: Colors.black),
                ),
              ],
            ).center,
          ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: double.maxFinite,
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: EdgeInsets.all(30.0),
        child: ButtonWidgetWithText(
          onPressed: () => Navigator.pushNamed(context, Routes.mainScreen),
          txt: "تم",
          backgroundColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}
