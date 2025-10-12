import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/app_bar_widget.dart';
import '../../../core/shared/button_widget_with_text.dart';

class DonePaymentScreen extends StatelessWidget {
  const DonePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: ""),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.0,
        children: [
          Image.asset(ImageApp.donePayment),
          Text('"تم تأكيد طلبك"' , style: getBoldStyle(color: Colors.black),),
          Text('جاري الآن البدء في العمل على طلبك' , style: getBoldStyle(color: AppColor.darkGreyColor2),),
          20.ph,
          ButtonWidgetWithText(
            onPressed: () {
              Navigator.pushNamed(context, Routes.trackRequest);
            },
            txt: "تتبع الطلب",
            widthButton: MediaQuery.sizeOf(context).width * 0.8,
            backgroundColor: AppColor.primaryColor,
          ),
          10.ph,
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.mainScreen);
            },
            child: Text('العودة الي الصفحة الرئيسيه' , style: getBoldStyle(color: AppColor.darkGreyColor2, fontSize: 18.0).copyWith(
              decorationColor: AppColor.darkGreyColor2,
              decoration: TextDecoration.underline,
            ),),
          ),
          100.ph,
        ],
      ).center,
    );
  }
}
