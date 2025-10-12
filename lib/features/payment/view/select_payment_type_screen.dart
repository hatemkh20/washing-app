import 'dart:developer';

import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/payment/view/done_payment_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/app_bar_widget.dart';

class SelectPaymentTypeScreen extends StatefulWidget {
  const SelectPaymentTypeScreen({super.key});

  @override
  State<SelectPaymentTypeScreen> createState() =>
      _SelectPaymentTypeScreenState();
}

class _SelectPaymentTypeScreenState extends State<SelectPaymentTypeScreen> {
  List<Image> image = [
    Image.asset(ImageApp.mada),
    Image.asset(ImageApp.mastercard),
    Image.asset(ImageApp.tabby),
    Image.asset(ImageApp.visa),
  ];
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "اختر طريقة الدفع"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [image[index]],
                  ),
                  value: index,
                  groupValue: selectedValue,
                  radioScaleFactor: 1.5,
                  contentPadding: EdgeInsets.all(15.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColor.primaryColor,
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColor.primaryColor;
                    }
                    return AppColor.darkGreyColor2;
                  }),
                  onChanged: (value) {
                    log(value.toString());
                    setState(() {
                      selectedValue = value;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
            20.ph,
            ButtonWidgetWithText(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DonePaymentScreen(),));
              },
              txt: "تأكيد الطلب",
              widthButton: MediaQuery.sizeOf(context).width * 0.8,
              backgroundColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
