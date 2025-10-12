import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../../core/shared/app_bar_widget.dart';
import '../../core/shared/text_filed_widget.dart';
import '../../core/style/app_font_style.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _controller = TextEditingController();

  String? selectedValue;

  final List<String> items = [
    "Area 1",
    "Area 2",
    "Area 3",
  ];
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
                  child: AppBarWidget(title: "اضافة الموقع"),
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
                TextFieldWidget(
                  validator: (val) {},
                  controller: _controller,
                  minLine: 2,
                  maxLine: 10,
                  hintText: "اضف ملاحظات",
                  obscureText: false,
                  onChange: (val) {},
                  borderColor: Colors.transparent,
                  prefixIcon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(ImageApp.location2),
                    ],
                  ),
                  fillColor: AppColor.darkGreyColor2.withOpacity(0.1),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      elevation: 0,
                      hint:  Text("حدد المنطقة" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColor.darkGreyColor2.withOpacity(0.1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
                      ),
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
                ),
                20.ph,
                ButtonWidgetWithText(
                    onPressed: () {},
                    txt: "تأكيد العنوان",
                    backgroundColor: AppColor.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
