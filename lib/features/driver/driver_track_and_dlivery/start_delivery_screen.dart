import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/app_bar_widget.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../driver_request/widget/driver_item_details_request.dart';

class StartDeliveryScreen extends StatefulWidget {
  const StartDeliveryScreen({super.key});

  @override
  State<StartDeliveryScreen> createState() => _StartDeliveryScreenState();
}

class _StartDeliveryScreenState extends State<StartDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: double.maxFinite,
                // color: AppColor.primaryLightColor.withOpacity(0.2),
                child: Text("الخريطة" , style: getBoldStyle(color: AppColor.primaryColor),).center,
              ),
              PreferredSize(
                preferredSize: Size(double.maxFinite, kToolbarHeight),
                child: AppBarWidget(title: ""),
              ),
            ],
          ),
          Container(
            // height: MediaQuery.sizeOf(context).height * 0.4,
            padding: EdgeInsets.all(20.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              // color: AppColor.darkGreyColor2.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                DriverItemDetailsRequest(
                  image: ImageApp.edit,
                  title: "اسم العميل :",
                  details: "عابد محمد",
                ),
                DriverItemDetailsRequest(
                  image: ImageApp.date,
                  title: "وقت الاستلام :",
                  details: "04:00 م 10/20/2025",
                ),
                DriverItemDetailsRequest(
                  image: ImageApp.location2,
                  title: "عنوان العميل :",
                  details: "حي اليرموك - الرياض",
                ),
                SafeArea(
                  child: ButtonWidgetWithText(
                    onPressed: () {},
                    txt: "ابدأ التوجيه GPS",
                    backgroundColor: AppColor.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
