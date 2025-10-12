import 'dart:developer';
import 'package:selectable_container/selectable_container.dart';
import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/shared/text_filed_widget.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? selectedIndex;

  String? selectedValue;

  final List<String> items = [
    "Visa",
    "Mastercard",
    "Mada",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "السلة"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.0,
          children: [
            //! List Of Product
            _listOfProduct(),
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

            //! Address
            SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width / 1,
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(),
                color: AppColor.darkGreyColor2.withOpacity(0.1),
                child:
                    Text(
                      "العنوان",
                      style: getMediumStyle(color: Colors.black),
                    ).center,
              ),
            ),
            Row(
              spacing: 10.0,
              children: [
                Image.asset(ImageApp.location2, color: Colors.amber),
                Expanded(
                  child: Text(
                    "التوصيل الي : الرياض , حي العليا , شارغ التحلية",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: getMediumStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            //! Start Date
            Text(
              "موعد الاستلام",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            ListTile(
              tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                ).then((value) async {
                  log("${value?.day} ");
                  if (value != null) if (!mounted) true;
                  await showTimePicker(
                    context: context,
                    helpText: "اختر وقت البداية",
                    initialTime: TimeOfDay.now(),
                  ).then((value) async {
                    if (!mounted) true;
                    await showTimePicker(
                      context: context,
                      helpText: "اختر وقت النهاية",
                      initialTime: TimeOfDay.now(),
                    );
                  });
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
              ),
              leading: Image.asset(ImageApp.calendar),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.darkGreyColor2,
              ),
              contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
              title: Text(
                "اختر التاريخ والوقت",
                style: getMediumStyle(
                  color: AppColor.darkGreyColor2,
                  fontSize: 14.0,
                ),
              ),
            ),

            //! Enda Date
            Text(
              "موعد التسليم",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            ListTile(
              tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                ).then((value) async {
                  log("${value?.day} ");
                  if (value != null) if (!mounted) true;
                  await showTimePicker(
                    context: context,
                    helpText: "اختر وقت البداية",
                    initialTime: TimeOfDay.now(),
                  ).then((value) async {
                    if (!mounted) true;
                    await showTimePicker(
                      context: context,
                      helpText: "اختر وقت النهاية",
                      initialTime: TimeOfDay.now(),
                    );
                  });
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
              ),
              leading: Image.asset(ImageApp.calendar),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.darkGreyColor2,
              ),
              contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
              title: Text(
                "اختر التاريخ والوقت",
                style: getMediumStyle(
                  color: AppColor.darkGreyColor2,
                  fontSize: 14.0,
                ),
              ),
            ),

            //! Option Order
            Text(
              "خيارات الطلب",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            // ListTile(
            //   tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
            //
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0),
            //     side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_rounded,
            //     color: AppColor.darkGreyColor2,
            //   ),
            //   contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
            //   title: Text(
            //     "Tap",
            //     style: getMediumStyle(
            //       color: AppColor.darkGreyColor3,
            //       fontSize: 14.0,
            //     ),
            //   ),
            // ),
            _dropDown(),
            //! note
            Text(
              "اضافة ملاحظات",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            TextFieldWidget(
              validator: (val) {},
              controller: TextEditingController(),
              hintText: "اضافة ملاحظات",
              obscureText: false,
              onChange: (val) {},
              fillColor: AppColor.darkGreyColor2.withOpacity(0.1),
              minLine: 1,
              maxLine: 10,
            ),
            //! Invoice
            Text(
              "تفاصيل الفاتورة",
              style: getBoldStyle(color: Colors.black, fontSize: 17.0),
            ),
            _summery(),
            ButtonWidgetWithText(
              onPressed: () {},
              txt: "متابعة لاتمام الطلب",
              widthButton: MediaQuery.sizeOf(context).width * 0.7,
              backgroundColor: AppColor.primaryColor,).center,
            10.ph,
          ],
        ),
      ),
    );
  }

  //! list of product
  Widget _listOfProduct(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return SelectableContainer(
          selected: isSelected,
          onValueChanged: (newValue) {
            setState(() {
              selectedIndex = index;
              log(index.toString());
            });
          },
          icon: Icons.clear,
          onPressed: (){
            log("message");
          },
          selectedBorderColor: AppColor.redColor,
          unselectedBorderColor: Colors.transparent,
          elevation: 0.0,
          selectedBackgroundColor: Colors.transparent,
          unselectedBackgroundColor:Colors.transparent,
          padding: 0.0,
          selectedBackgroundColorIcon: AppColor.redColor,
          unselectedOpacity:1.0,
          topMargin: 0.0,
          borderRadius: 15.0,
          leftMargin: 0.0,
          rightMargin: 0.0,
          bottomMargin: 0.0,
          child: Card(
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
                            Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 15.0,
                            ),
                            Text(
                              "1",
                              style: getBoldStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 5.0),
                  //     child: Text(
                  //       "100 ريال",
                  //       style: getMediumStyle(
                  //         color: Colors.black,
                  //         fontSize: 14.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
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
  //! drop down
  Widget _dropDown (){
    return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          elevation: 0,
          hint:  Text("خيارات الطلب" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200], // 🎨 هنا الـ fillColor
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColor.darkGreyColor2.withOpacity(0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 1.5), // ✅ Border عادي
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 2), // ✅ Border لما يتعمل Focus
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          ),
          // hint: const Text("اختر طريقة الدفع"),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
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
