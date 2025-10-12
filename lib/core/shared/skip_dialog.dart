

import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../local/shared_prefs_manager.dart';
import '../routing/routes.dart';
import '../style/app_color.dart';
import '../style/app_font_style.dart';

void  showDialogSkip(BuildContext context){
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("انتبه !" , style: getBoldStyle(color: AppColor.primaryColor),),
      content: Text("يرجي تسجيل الدخول اولا ؟" , style: getRegularStyle(color: Colors.black),),
      actions: [
        TextButton(
          child: Text("نعم", style: getRegularStyle(color: AppColor.primaryColor)),
          onPressed: ()async {
            await SharedPrefsManager.removeData(key: "isSkipping");
            final navigator = globalNavigatorKey.currentState;
            if (navigator != null && navigator.mounted) {
              navigator.pushNamedAndRemoveUntil(
                Routes.onBoardingScreen,
                    (route) => false,
              );
            }
          },
        ),
        TextButton(
          child: Text("الغاء", style: getRegularStyle(color: AppColor.primaryColor)),
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  },);
}

