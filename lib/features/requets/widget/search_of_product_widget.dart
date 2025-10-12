import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';

class SearchOfProductWidget extends StatefulWidget {
  const SearchOfProductWidget({super.key});

  @override
  State<SearchOfProductWidget> createState() => _SearchOfProductWidgetState();
}

class _SearchOfProductWidgetState extends State<SearchOfProductWidget> {
  final TextEditingController _controller = TextEditingController();
  bool switch1 = false;
  bool switch2 = false;

  String? selectedValue;

  final List<String> items = [
    "Perfume 1",
    "Perfume 2",
    "Perfume 3",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10.0,
      children: [
        10.ph,
        TextFieldWidget(
          validator: (val) {},
          controller: _controller,
          hintText: "ابحث عن المنتجات",
          obscureText: false,
          onChange: (val) {},
          borderColor: AppColor.blueDark,
          prefixIcon: Image.asset(ImageApp.search),
          // Icon(
          //   Icons.search_rounded,
          //   color: AppColor.darkGreyColor3,
          // ),
          suffixIcon: Icon(Icons.clear, color: AppColor.darkGreyColor3),
          fillColor: AppColor.darkGreyColor2.withOpacity(0.1),
        ),
        //! List Of Donation Organization
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0.0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                leading: Card(
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.image),
                  ),
                ),
                trailing: Card(
                  elevation: 0.0,
                  color: AppColor.darkGreyColor2.withOpacity(0.2),
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
                title: Text(
                  "منتج ${index+1}",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
            );
          },
        ),
        Text("خدمات اضافية", style: getBoldStyle(color: Colors.black),),
        SizedBox(
          width: double.maxFinite,
          child: Card(
            elevation: 0.0,
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10.0,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      RotatedBox(
                        quarterTurns: 90,
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: AppColor.primaryColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: switch1,
                          onChanged: (value) {
                            setState(() {
                              switch1 = !switch1;
                            });
                          },
                        ),
                      ),
                      Text(
                        "مستعجل",
                        style: getSemiBoldStyle(
                          color: AppColor.darkGreyColor3,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      RotatedBox(
                        quarterTurns: 90,
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: AppColor.primaryColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: switch2,
                          onChanged: (value) {
                            setState(() {
                              switch2 = !switch2;
                            });
                          },
                        ),
                      ),
                      Text(
                        "تعطير برائحة الزهور",
                        style: getSemiBoldStyle(
                          color: AppColor.darkGreyColor3,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  if(switch2)
                    SizedBox(
                      width: double.maxFinite,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          value: selectedValue,
                          elevation: 0,
                          hint:  Text("اختار الرائحة ....." , style: getMediumStyle(color: AppColor.darkGreyColor2),),
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
                    )

                ],
              ),
            ),
          ),
        ),
        //! new list product selected
        Text("المنتجات المختارة ", style: getBoldStyle(color: Colors.black),),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0.0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                leading: Card(
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.image),
                  ),
                ),
                trailing: Card(
                  elevation: 0.0,
                  color: AppColor.darkGreyColor2.withOpacity(0.2),
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
                title: Text(
                  "منتج ${index+1}",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
            );
          },
        ),

      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
