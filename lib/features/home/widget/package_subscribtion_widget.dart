import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_icon.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_font_style.dart';

class PackageSubscribtionWidget extends StatelessWidget {
  const PackageSubscribtionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width /1,
      color: AppColor.lightBlueColor,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.0,
        children: [
          Text("باقات الاستراك", style: getBoldStyle(color: Colors.black),),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColor.blueDark,
                  alignment: Alignment.center,
                  height: 55.0,
                  width: MediaQuery.sizeOf(context).width /1,
                  child: Text("الباقة الاساسية", style: getBoldStyle(color: Colors.white),),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width /1,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10.0,
                    children: [
                      Text("6 طلبات شهرية 250 ريال بدلا", style: getBoldStyle(color: Colors.black,fontSize: 16.0),),
                      Text("من 230 ريال", style: getBoldStyle(color: Colors.black,fontSize: 16.0),),
                      ButtonWidgetWithIcon(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.detailsPackage);
                          },
                        widthButton: 150.0,
                        heightButton: 45.0,
                          txt: "اشترك الأن",
                          color: AppColor.primaryLightColor,
                      // iconData: Icons.padding_rounded,
                        iconDataWidget: Image.asset(ImageApp.package),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
