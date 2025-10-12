import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/style/app_color.dart';
import '../view/rate_screen.dart';

class ActionPartWidget extends StatelessWidget {
  const ActionPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWidgetWithText(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
          },
          txt: "تقيم الطلب",
          widthButton: MediaQuery.sizeOf(context).width *0.43,
          backgroundColor: AppColor.primaryColor,
          // sizeText: 14.0,
          // heightButton: 45.0,
        ),
        ButtonWidgetWithText(
          onPressed: () {
            // Navigator.pushNamed(context, Routes.trackRequest);
          },
          txt: "اعادة الطلب",
          widthButton: MediaQuery.sizeOf(context).width *0.43,
          backgroundColor: Colors.white54,
          borderColor: AppColor.primaryColor,
          colorText: AppColor.primaryColor,
          // sizeText: 14.0,
          // heightButton: 45.0,
        ),
      ],
    );
  }
}
