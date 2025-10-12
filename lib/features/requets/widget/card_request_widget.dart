import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/requets/view/rate_screen.dart';
import 'package:flutter/material.dart';

class CardRequestWidget extends StatelessWidget {
  final int index;
  const CardRequestWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsRequest, arguments: {"id" : index});
      },
      child: Card(
        elevation: 0.0,
        // color:(index == 2)? null  : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:(index == 2) ? Colors.redAccent.withOpacity(0.5) : Theme.of(context).cardColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.0,
            children: [
              //! urgent
              if(index == 2)
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.0,
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.red,),
                  Text("مستعجل" , style: getBoldStyle(color: Colors.red, fontSize: 16.0),),

                ],
              ),
              //! number invoice and price
              Row(
                children: [
                  Text("#235468729" , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                  Spacer(),
                  Image.asset(ImageApp.wallet),
                  5.pw,
                  Text("100 ريال" , style: getMediumStyle(color: Colors.black),),
                  30.pw,
                ],
              ),

              //! driver details
              Row(
                children: [
                  Image.asset(ImageApp.driver),
                  5.pw,
                  Text("اسم السائق : " , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                  Text("عابد محمد" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
                ],
              ),

              //! details order
              Row(
                children: [
                  Image.asset((index ==1 || index == 2) ? ImageApp.process : ImageApp.done),
                  5.pw,
                  Text((index ==1 || index == 2) ? "تحت التنفيذ" : "مكتملة" , style: getMediumStyle(color: AppColor.darkGreyColor3),),
                  Spacer(),
                  Image.asset(ImageApp.date),
                  5.pw,
                  Text("25/8/2025" , style: getMediumStyle(color: AppColor.darkGreyColor3),),
                  30.pw,
                ],
              ),

              //! action
              if(index ==1 || index ==2)
                ButtonWidgetWithText(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.trackRequest);
                    },
                    txt: "تتبع الطلب",
                    backgroundColor: AppColor.primaryColor,
                  sizeText: 14.0,
                  heightButton: 45.0,
                ),

              if(index == 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidgetWithText(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
                        },
                        txt: "تقيم الطلب",
                        widthButton: MediaQuery.sizeOf(context).width *0.4,
                        backgroundColor: AppColor.primaryColor,
                      sizeText: 14.0,
                      heightButton: 45.0,
                    ),
                    ButtonWidgetWithText(
                        onPressed: () {
                          // Navigator.pushNamed(context, Routes.trackRequest);
                        },
                        txt: "اعادة الطلب",
                        widthButton: MediaQuery.sizeOf(context).width *0.4,
                        backgroundColor: Colors.white54,
                        borderColor: AppColor.primaryColor,
                       colorText: AppColor.primaryColor,
                       sizeText: 14.0,
                      heightButton: 45.0,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
