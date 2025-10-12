import 'dart:developer';

import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/shared/text_filed_widget.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

class DonationServicesScreen extends StatefulWidget {
  const DonationServicesScreen({super.key});

  @override
  State<DonationServicesScreen> createState() => _DonationServicesScreenState();
}

class _DonationServicesScreenState extends State<DonationServicesScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "خدمات التبرع"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.0,
          children: [
            //! Search Field
            TextFieldWidget(
              validator: (val) {},
              controller: _controller,
              hintText: "ابحث عن الجمعيات",
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
                    title: Text(
                      "جمعيه ${index+1}",
                      style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                );
              },
            ),
            //! Receive
            Text("عنوان الاستلام", style: getBoldStyle(color: Colors.black, fontSize: 17.0)),
            ListTile(
              tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
              ),
              leading: Image.asset(ImageApp.location),
              // Icon(
              //   Icons.edit_location_alt_sharp,
              //   color: AppColor.darkGreyColor3,
              // ),
              title: Text(
                "اختر الموقع",
                style: getMediumStyle(
                  color: AppColor.darkGreyColor3,
                  fontSize: 14.0,
                ),
              ),
            ),
            //! Date
            Text("وقت الاستلام", style: getBoldStyle(color: Colors.black, fontSize: 17.0)),
            ListTile(
              tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                ).then((value) async {
                  log("${value?.day} ");
                  if(value != null)
                  if (!mounted) true;
                  await showTimePicker(
                    context: context,
                    helpText: "اختر وقت البداية",
                    initialTime: TimeOfDay.now(),
                  ).then((value)async {
                    if (!mounted) true;
                    await showTimePicker(
                    context: context,
                    helpText: "اختر وقت النهاية",
                    initialTime: TimeOfDay.now(),
                    );
                  },);
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
              ),
              leading: Image.asset(ImageApp.calendar),
              // Icon(
              //   Icons.date_range_rounded,
              //   color: AppColor.darkGreyColor3,
              // ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.darkGreyColor3,
              ),
              contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
              title: Text(
                "اختر التاريخ والوقت",
                style: getMediumStyle(
                  color: AppColor.darkGreyColor3,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width / 1,
        height: MediaQuery.sizeOf(context).height * 0.1,
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Text("تأكيد التبرع", style: getBoldStyle(color: Colors.white)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
