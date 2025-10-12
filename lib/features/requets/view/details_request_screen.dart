import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/app_bar_widget.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../widget/action_part_widget.dart';
import '../widget/info_request_widget.dart';
import '../widget/list_of_product_request_widget.dart';

class DetailsRequestScreen extends StatefulWidget {
  final int index;
  const DetailsRequestScreen({super.key, required this.index});

  @override
  State<DetailsRequestScreen> createState() => _DetailsRequestScreenState();
}

class _DetailsRequestScreenState extends State<DetailsRequestScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.0,
          children: [
            InfoRequestWidget(
              index: widget.index,
            ),
            Text("ملخص الطلب", style: getBoldStyle(color: Colors.black , fontSize: 17.0),),
            ListOfProductRequestWidget(),
            Text("خدمات اضافية", style: getBoldStyle(color: Colors.black , fontSize: 17.0),),
            Card(
              elevation: 0.0,
              color: AppColor.primaryLightColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    RotatedBox(
                      quarterTurns: 90,
                      child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor:AppColor.primaryColor ,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: true, onChanged: (value) {
                      },),
                    ),
                    Text(
                      "مستعجل",
                      style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 15.0),
                    ),
                    Spacer(),
                    RotatedBox(
                      quarterTurns: 90,
                      child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor:AppColor.primaryColor ,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: true, onChanged: (value) {
                      },),
                    ),
                    Text(
                      "تعطير برائحة الزهور",
                      style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "تفاصيل الفاتورة",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            _summery(),
            //! contact with driver
            Card(
              elevation: 0.0,
              color:Colors.transparent,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color:AppColor.darkGreyColor2.withOpacity(0.2),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    //! driver
                    Row(
                      children: [
                        Image.asset(ImageApp.edit),
                        5.pw,
                        Text("اسم السائق : " , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                        Text("عابد محمد" , style: getMediumStyle(color: Colors.black),),
                      ],
                    ),
                    //! contact
                    Row(
                      children: [
                        Icon(Icons.phone_in_talk_sharp , color: Colors.amber,),
                        5.pw,
                        Text("التواصل مع المغسلة" , style: getMediumStyle(color: Colors.black, fontSize: 17.0).copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primaryColor,
                          color: AppColor.primaryColor,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if(widget.index == 0)
            ActionPartWidget(),
            if(widget.index == 1 || widget.index == 2)
              ButtonWidgetWithText(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.trackRequest);
                },
                txt: "تتبع الطلب",
                backgroundColor: AppColor.primaryColor,
              ),
            15.ph,
          ],
        ),
      ),
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
