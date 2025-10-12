import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/app_color.dart';

Future<bool?> toastSuccess({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.primaryColor,
      textColor: Colors.white,
      fontAsset: "assets/font/Cairo-Medium.ttf",
      fontSize: 12.0);
}

Future<bool?> toastError({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.redColor,
      textColor: Colors.white,
      fontAsset: "assets/font/Cairo-Medium.ttf",
      fontSize: 12.0);
}

Future<bool?> toastWarning({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.amberAccent,
      textColor: Colors.black,
      fontAsset: "assets/font/Cairo-Medium.ttf",
      fontSize: 13.0);
}
