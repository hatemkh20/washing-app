import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/driver/driver_request/widget/driver_item_details_request.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/button_widget_with_text.dart';
import '../../../../core/utils/image_app.dart';

class DriverDetailsRequestScreen extends StatefulWidget {
  final String statues ;
  const DriverDetailsRequestScreen({super.key, required this.statues});

  @override
  State<DriverDetailsRequestScreen> createState() => _DriverDetailsRequestScreenState();
}

class _DriverDetailsRequestScreenState extends State<DriverDetailsRequestScreen> {
  String _statues (String type){
    switch(type){
      case "process":
        return "قيد التنفيذ";
      case "accepted":
        return "مقبولة";
      case "rejected":
        return "مرفوضة";
      default :
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "تفاصيل الطلب"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
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
            DriverItemDetailsRequest(
              iconDate: Icons.change_circle,
              title: "حالة الطلب : ",
              details:  _statues(widget.statues),
              colorDetails: AppColor.primaryColor,
            ),
            5.ph,
            Text("ملخص الطلب" , style: getBoldStyle(color: AppColor.darkGreyColor3, fontSize: 16.0),),
            _listOfProduct(),
            Text(
              "تفاصيل الفاتورة",
              style: getBoldStyle(color: Colors.black, fontSize: 16.0),
            ),
            _summery(),
            Text("ملحوظه", style: getSemiBoldStyle(color: Colors.black, fontSize: 16.0),),
            Text("كل العناصر تم فحصها جيدا وجاهزه للبدء بمجرد دفع الفاتوره",
              style: getMediumStyle(color: AppColor.darkGreyColor3,fontSize: 12.0),),
            if(widget.statues == "process")...[
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidgetWithText(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
                    },
                    txt: "قبول الطلب",
                    widthButton: MediaQuery.sizeOf(context).width *0.4,
                    backgroundColor: AppColor.primaryColor,
                    sizeText: 14.0,
                    heightButton: 45.0,
                  ),
                  ButtonWidgetWithText(
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.trackRequest);
                    },
                    txt: "رفض الطلب",
                    widthButton: MediaQuery.sizeOf(context).width *0.4,
                    backgroundColor: Colors.white54,
                    borderColor: AppColor.primaryColor,
                    colorText: AppColor.primaryColor,
                    sizeText: 14.0,
                    heightButton: 45.0,
                  ),
                ],
              )
            ]else if(widget.statues == "accepted")...[
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidgetWithText(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
                    },
                    txt: "بدء التنقل",
                    widthButton: MediaQuery.sizeOf(context).width *0.4,
                    backgroundColor: AppColor.primaryColor,
                    sizeText: 14.0,
                    heightButton: 45.0,
                  ),
                  ButtonWidgetWithText(
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.trackRequest);
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
            ]else ...[
              ButtonWidgetWithText(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => RateScreen(),));
                },
                txt: "تراجع عن الرفض",
                widthButton: MediaQuery.sizeOf(context).width *0.8,
                backgroundColor: AppColor.primaryColor,
                sizeText: 14.0,
                heightButton: 45.0,
              ).center,
            ]
          ],
        ),
      ),
    );
  }

  //! list of product
  Widget _listOfProduct(){
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.0,
          color: AppColor.darkGreyColor2.withOpacity(0.1),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Image.asset(
                    ImageApp.logo,
                    height: 50.0,
                    width: 50.0,
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "منتج ${index + 1}",
                        style: getBoldStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "100 ريال",
                        style: getMediumStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  trailing: Card(
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 5.0,
                        children: [
                          Text(
                            "عدد القطع : ",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            "1",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => 10.ph,
    );
  }
  //! summery
  Widget _summery (){
    return Card(
      elevation: 0.0,
      color: AppColor.darkGreyColor2.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _itemDetailsSummery(
              title:
              "تكلفة العناصر :",
              value: "0.0",
            ),
            Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
            _itemDetailsSummery(
              title:
              "ضريبة القيمة المصافة :",
              value: "0.0",
            ),
            Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
            _itemDetailsSummery(
              title:
              ( "رسوم التوصيل :"
              ),
              value: "0.0",
            ),
            // Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
            // _itemDetailsSummery(
            //   title:
            //   "تطبيق الخصم :"
            //   ,
            //   value: "0.0",
            //   valueColor: AppColor.redColor,
            // ),
            Divider(
              color: AppColor.darkGreyColor3.withOpacity(0.2),
              thickness: 1.5,
            ),
            _itemDetailsSummery(
              title:
              "المبلغ الإجمالي",
              total: "0.0" ?? "",
              value: "0.0" ?? "",
              valueColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
  Widget _itemDetailsSummery({
    required String title,
    required String value,
    Color? valueColor,
    String? total,
  }) {
    return Row(
      spacing: 5.0,
      children: [
        Text(
          title,
          style: getMediumStyle(color: AppColor.darkGreyColor3, fontSize: 14.0),
        ),
        Text(
          (total != null) ? "($total عنصر)" : "",
          style: getMediumStyle(color: AppColor.darkGreyColor3, fontSize: 11.0),
        ),
        Spacer(),
        Text(
          "$value${(Localizations.localeOf(context).toString() == "ar") ? " ﷼" : " SAR"}",
          style: getMediumStyle(
            color: valueColor ?? AppColor.darkGreyColor3,
            fontSize: (total != null) ? 16.0 : 14.0,
          ),
        ),
      ],
    );
  }
}
