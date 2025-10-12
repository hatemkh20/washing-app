import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../local/shared_prefs_manager.dart';
import '../routing/routes.dart';
import '../style/app_color.dart';
import '../style/app_font_style.dart';

void showDialogSkip(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          (Localizations.localeOf(context).toString() == "ar")
              ? "انتبه !"
              : "Attention !",
          style: getBoldStyle(color: AppColor.primaryColor),
        ),
        content: Text(
          (Localizations.localeOf(context).toString() == "ar")
              ? "يرجي تسجيل الدخول اولا ؟"
              : "Please Login First ?",
          style: getRegularStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: Text(
              (Localizations.localeOf(context).toString() == "ar")
                  ? "نعم"
                  : "Confirm",
              style: getSemiBoldStyle(color: AppColor.primaryColor, fontSize: 14.0),
            ),
            onPressed: () async {
              await SharedPrefsManager.removeData(key: "skip").then((value) {
                Navigator.pushNamedAndRemoveUntil(
                  globalNavigatorKey.currentState!.context,
                  Routes.loginScreen,
                  (route) => false,
                );
              });
            },
          ),
          TextButton(
            child: Text(
              (Localizations.localeOf(context).toString() == "ar")
                  ? "الغاء"
                  : "Close",
              style: getSemiBoldStyle(color: AppColor.primaryColor, fontSize: 14.0),
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> globalCheckSkippingMode(String routeName,
    {Map<String, dynamic> ? arg}) async {
  var checkSkip = await SharedPrefsManager.getData(key: "skip");
  if (checkSkip != null) {
    showDialogSkip(globalNavigatorKey.currentState!.context);
  } else {
    Navigator.pushNamed(globalNavigatorKey.currentState!.context,routeName, arguments:arg );
  }
}



// Future<void> openCallPhoneApp({required String phone}) async {
//   final Uri telUri = Uri(scheme: 'tel', path: phone);
//
//   if (await canLaunchUrl(telUri)) {
//     await launchUrl(
//       telUri,
//       mode: Platform.isIOS
//           ? LaunchMode.platformDefault // iOS will use the system dialer
//           : LaunchMode.externalApplication, // Android external app
//     );
//   } else {
//     await toastError(message: "No Number Found");
//   }
// }