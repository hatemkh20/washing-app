import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';

class AdditionServiceWidget extends StatefulWidget {
  const AdditionServiceWidget({super.key});

  @override
  State<AdditionServiceWidget> createState() => _AdditionServiceWidgetState();
}

class _AdditionServiceWidgetState extends State<AdditionServiceWidget> {
  final TextEditingController _controller = TextEditingController();
  bool switch1 = false;
  bool switch2 = false;

  String? selectedValue;

  final List<String> items = [
    "Visa",
    "Mastercard",
    "Mada",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          Text("خيارات الطلب", style: getBoldStyle(color: Colors.black),),
          SizedBox(
              width: double.maxFinite,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  elevation: 0,
                  hint:  Text("اختر طريقة الدفع" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
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
          Text("اضافة ملاحظات", style: getBoldStyle(color: Colors.black),),
          TextFieldWidget(
            validator: (val) {},
            controller: _controller,
            minLine: 1,
            maxLine: 10,
            hintText: "اضف ملاحظات",
            obscureText: false,
            onChange: (val) {},
            borderColor: Colors.transparent,
            fillColor: AppColor.darkGreyColor2.withOpacity(0.1),
          ),
          Text(" تفاصيل الفاتورة", style: getBoldStyle(color: Colors.black),),
          _summery(),
        ],
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
