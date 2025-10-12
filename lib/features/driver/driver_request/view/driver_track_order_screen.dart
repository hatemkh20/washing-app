import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/image_app.dart';
import '../widget/driver_item_details_request.dart';

class DriverTrackOrderScreen extends StatefulWidget {
  const DriverTrackOrderScreen({super.key});

  @override
  State<DriverTrackOrderScreen> createState() => _DriverTrackOrderScreenState();
}

class _DriverTrackOrderScreenState extends State<DriverTrackOrderScreen> {
  int selectedIndex = 0;

  List<String> title = [
   "تأكبد الاستلام",
   "تأكيد التسليم للمغسلة",
   "تأكيد الاستلام من للمغسلة",
   "تأكيد الاستلام للعميل",
  ];

  List<String> image = [
    ImageApp.done,
    ImageApp.step2,
    ImageApp.step4,
    ImageApp.step1,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "تحديث الحالة"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15.0,
          children: [
            //! List of statues
            _listOfStatues(),
            _cardDetails(),
            _address(),
            _summery(),
            ButtonWidgetWithText(
                onPressed: () {},
                txt: "تحديث الحالة",
                // txt: "تأكيد التسليم من المغسلة",
                backgroundColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  //! List statues
  Widget _listOfStatues (){
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        cacheExtent: 500,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).height * 0.20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Card(
                elevation: 0.0,
                color: (selectedIndex == index) ? AppColor.primaryColor : AppColor.darkGreyColor2.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20.0,
                    children: [
                      Text(title[index], style: getBoldStyle(color:(selectedIndex == index) ?
                      Colors.white : AppColor.primaryColor, fontSize: 12.0),),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:(selectedIndex == index) ?
                          Colors.white : AppColor.primaryColor,
                          // border: Border.all(
                          //     color:(selectedIndex == index) ?
                          //     Colors.white : AppColor.primaryColor,
                          //   width: 1.8,
                          // )
                        ),
                        child: Image.asset(image[index],
                            color:(selectedIndex == index) ?
                            AppColor.primaryColor : Colors.white
                        ),
                      ),
                    ],
                  ).center,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 10.pw,
      ),
    );
  }

  //! Card Details
 Widget _cardDetails(){
    return Card(
      color: AppColor.darkGreyColor2.withOpacity(0.2),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14.0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10.0,
              children: [
                Icon(Icons.numbers_outlined , color: Colors.amber,),
                Text("#235468729" , style: getBoldStyle(color: AppColor.darkGreyColor3 , fontSize: 16.0),),
                Spacer(),
                Text("8 قطع" , style: getBoldStyle(color: AppColor.darkGreyColor3 , fontSize: 16.0),),
              ],
            ),
            DriverItemDetailsRequest(
              image: ImageApp.edit,
              title: "اسم العميل :",
              details: "عابد محمد",
            ),
            DriverItemDetailsRequest(
              image: ImageApp.calendar,
              title: "تاريخ التسليم :",
              details: "10/20/2025",
            ),
            DriverItemDetailsRequest(
              image: ImageApp.date,
              title: "وقت الاستلام :",
              details: "04:00",
            ),
          ],
        ),
      ),
    );
 }

 //! address
 Widget _address (){
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.0,
      children: [
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            color: AppColor.darkGreyColor2.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text("الخريطة", style: getBoldStyle(color: AppColor.primaryColor),).center,
        ),
        Row(
          spacing: 7.0,
          children: [
            Image.asset(ImageApp.location2, color: Colors.amber,),
            Text("التوصيل إلى: الرياض، حي العليا، شارع التحلية" ,
              style: getMediumStyle(color: AppColor.darkGreyColor3 , fontSize: 16.0),),
          ],
        ),
      ],
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
            Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
            _itemDetailsSummery(
              title:
              "تطبيق الخصم :"
              ,
              value: "0.0",
              valueColor: AppColor.redColor,
            ),
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
  //! item invoice card
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
