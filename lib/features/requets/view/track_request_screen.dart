import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/app_bar_widget.dart';

class TrackRequestScreen extends StatefulWidget {
  const TrackRequestScreen({super.key});

  @override
  State<TrackRequestScreen> createState() => _TrackRequestScreenState();
}

class _TrackRequestScreenState extends State<TrackRequestScreen> {
  List<String> title = [
    "تم استلام الملابس من المندوب وجاري فحصها",
    "بانتظار دفع الفاتورة",
    " تم الدفع - جاري الغسيل",
    " تم الانتهاء من الغسيل",
    "جاري التوصيل",
    "في مرحله التسليم",
  ];
  List<String> subTitle = [
    "العامل في المغسلة استلم الملابس وبدأ بفحصها",
    "تم إصدار الفاتورة بناءً على الفحص، يرجي الدفع ",
    "بعد إتمام الدفع، بدأنا عملية الغسيل حسب نوع القطع.",
    "الطلب أصبح جاهز  للتوصيل.",
    "المندوب في الطريق لتوصيل الطلب للعميل.",
    "المندوب في الطريق لتوصيل الطلب للعميل.",
  ];

  List<String> image = [
    ImageApp.step1,
    ImageApp.step2,
    ImageApp.wallet,
    ImageApp.step1,
    ImageApp.step4,
    ImageApp.step6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "تتبع الطلب"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.0,
            children: [
              //! request
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "رقم الطلب : ",
                      style: getBoldStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    TextSpan(
                      text: "#12365544 ",
                      style: getBoldStyle(
                        color: AppColor.darkGreyColor2,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              //! driver name
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "اسم السائق : ",
                      style: getBoldStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    TextSpan(
                      text: " عابد محمد",
                      style: getBoldStyle(
                        color: AppColor.darkGreyColor2,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              //! stepper
              SizedBox(
                // width: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 5.0,
                          children: [
                            Text(
                              title[index],
                              style: getBoldStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                              ),
                            ),
                            Text(
                              subTitle[index],
                              style: getBoldStyle(
                                color: AppColor.darkGreyColor2,
                                fontSize: 11.0,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              shape: CircleBorder(
                                side: BorderSide(

                                  color:
                                      (index == 1 ||
                                              index == 2 ||
                                              index == 3 ||
                                              index == 4 ||
                                              index == 5)
                                          ? AppColor.darkGreyColor2
                                          : AppColor.primaryColor,
                                  width: 2,
                                ),
                              ),
                              color: Colors.transparent,
                              margin: EdgeInsets.zero,
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  image[index],
                                  color:
                                      (index == 1 ||
                                              index == 2 ||
                                              index == 3 ||
                                              index == 4 ||
                                              index == 5)
                                          ? AppColor.darkGreyColor2
                                          : AppColor.primaryColor,
                                ),
                              ),
                            ),

                            (index == 5)
                                ? Container()
                                : EasyLine(
                                  color:
                                      (index == 1 ||
                                              index == 2 ||
                                              index == 3 ||
                                              index == 4 ||
                                              index == 5)
                                          ? AppColor.darkGreyColor2
                                          : AppColor.primaryColor,
                                  axis: Axis.vertical,
                                  lineType:
                                      (index == 1 ||
                                              index == 2 ||
                                              index == 3 ||
                                              index == 4)
                                          ? LineType.dotted
                                          : LineType.normal,
                                  thickness: 2.0,
                                ),
                          ],
                        ),
                      ],
                    );
                  },
                  // separatorBuilder:
                  //     (context, index) => Padding(
                  //       padding: const EdgeInsets.only(left: 25),
                  //       child:
                  //     ),
                  itemCount: 6,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
