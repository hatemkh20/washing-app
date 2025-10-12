import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/driver/driver_request/widget/driver_item_details_request.dart';
import 'package:clean_point/features/driver/driver_track_and_dlivery/start_delivery_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/button_widget_with_text.dart';
import '../../../../core/style/app_color.dart';
import '../../../../core/utils/image_app.dart';
import 'driver_details_request_screen.dart';

class DriverAcceptedScreen extends StatelessWidget {
  const DriverAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DriverDetailsRequestScreen(
                statues: "accepted",
              ),));
            },
            child: Card(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.2), width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
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
                    DriverItemDetailsRequest(
                      image: ImageApp.quantity,
                      title: "عدد القطع :",
                      details: "8",
                    ),
                    DriverItemDetailsRequest(
                      image: ImageApp.note,
                      title: "ملاحظات :",
                      details: " يوجد ملابس تحتاج تنظيف جاف ",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidgetWithText(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StartDeliveryScreen(),));
                          },
                          txt: "بدء التنقل",
                          widthButton: MediaQuery.sizeOf(context).width *0.4,
                          backgroundColor: AppColor.primaryColor,
                          sizeText: 14.0,
                          heightButton: 45.0,
                        ),
                        ButtonWidgetWithText(
                          onPressed: () {

                          },
                          txt: "الاتصال بالعميل",
                          widthButton: MediaQuery.sizeOf(context).width *0.4,
                          backgroundColor: Colors.white54,
                          borderColor: AppColor.primaryColor,
                          colorText: AppColor.primaryColor,
                          sizeText: 14.0,
                          heightButton: 45.0,
                          padding: 0.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 10.ph,
      );
  }
}
