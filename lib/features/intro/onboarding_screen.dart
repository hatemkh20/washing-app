import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/local/flutter_secure_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.onboarding),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 30.0,
          children: [
            Text("غسيلك علينا", style: getBoldStyle(color: Colors.black)),
            Text(
              "لا تشيل هم الغسيل! اطلب واحنا نجي نأخذ ملابسك ونرجعها لك نظيفة ومعطرة",
              style: getMediumStyle(color: AppColor.darkGreyColor2,fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
            23.ph,
            ButtonWidgetWithText(
                onPressed: () async{
                  await FlutterSecureManager.writeData(
                    key: "onBoard",
                    value: "1",
                  ).then((value) {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false,);
                  },);

                },
                txt: "التالي",
                backgroundColor: AppColor.primaryColor,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,)
          ],
        ),
      ),
    );
  }
}
