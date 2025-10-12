
import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final TextEditingController _controller = TextEditingController();
  bool switch1 = false;
  bool switch2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        scrolledUnderElevation: 0.0,
        title: Text("الفاتورة", style: getBoldStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.0,
        leading: Card(
          elevation: 0.0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10.0,
            children: [
              Text(
                " تفاصيل الفاتورة",
                style: getBoldStyle(color: AppColor.primaryLightColor, fontSize: 17.0),
              ).center,
              _detailsRequest(),
              _listOfProduct(),
              Text("خدمات اضافية", style: getBoldStyle(color: Colors.black),),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  elevation: 0.0,
                  color: AppColor.primaryLightColor.withOpacity(0.1),
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
                
                
                      ],
                    ),
                  ),
                ),
              ),
              Text("كوبون الخصم", style: getBoldStyle(color: Colors.black),),
              _applyCoupon(),
              Text("ملخص الفاتورة", style: getBoldStyle(color: Colors.black),),
              _summery(),
              ButtonWidgetWithText(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.selectPaymentTypeScreen);
                },
                txt: "اختيار طريقه الدفع",
                backgroundColor: AppColor.primaryLightColor,
              ),
              Text("ملحوظه", style: getSemiBoldStyle(color: Colors.black, fontSize: 16.0),),
              Text("كل العناصر تم فحصها جيدا وجاهزه للبدء بمجرد دفع الفاتوره",
                style: getMediumStyle(color: AppColor.darkGreyColor3,fontSize: 12.0),),
            ],
          ),
        ),
      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget _detailsRequest(){
    return Card(
      elevation: 0.0,
      color: AppColor.darkGreyColor2.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10.0,
          children: [
            //! number invoice
            Row(
              children: [
                Image.asset(ImageApp.invoiceNumber),
                5.pw,
                Text(
                  "رقم الفاتورة : ",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
                Text(
                  "INV-104256",
                  style: getBoldStyle(color: AppColor.darkGreyColor2, fontSize: 14.0),
                ),
              ],
            ),
            //! date invoice
            Row(
              children: [
                Image.asset(ImageApp.invoiceCalender),
                5.pw,
                Text(
                  "تاريخ الفاتورة : ",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
                Text(
                  "24/10/2025",
                  style: getBoldStyle(color: AppColor.darkGreyColor2, fontSize: 14.0),
                ),
              ],
            ),
            //! date invoice
            Row(
              children: [
                Image.asset(ImageApp.invoicePerson),
                5.pw,
                Text(
                  "اسم العميل : ",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
                Text(
                  "عمير محمد",
                  style: getBoldStyle(color: AppColor.darkGreyColor2, fontSize: 14.0),
                ),
              ],
            ),
            //! package invoice
            Row(
              children: [
                Image.asset(ImageApp.invoicePackage),
                5.pw,
                Text(
                  "رقم الكيس : ",
                  style: getBoldStyle(color: Colors.black, fontSize: 14.0),
                ),
                Text(
                  "INV-104256",
                  style: getBoldStyle(color: AppColor.darkGreyColor2, fontSize: 14.0),
                ),
              ],
            ),
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
        );
      }, separatorBuilder: (BuildContext context, int index) => 10.ph,
    );
  }

  Widget _applyCoupon(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFieldWidget(
            validator: (val) {},
            controller: _controller,
            minLine: 1,
            maxLine: 10,
            hintText: "ادخل كوبون الخصم",
            obscureText: false,
            onChange: (val) {},
            borderColor: AppColor.darkGreyColor2.withOpacity(0.1),
            fillColor: Colors.white,
          ),
        ),
        10.pw,
        ButtonWidgetWithText(
            onPressed: () {},
            txt: "تطبيق",
            widthButton: 120,
            backgroundColor: AppColor.primaryColor,
            sizeText: 13.0,
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
              total: "0" ?? "",
              value: "0.0" ?? "",
              valueColor: AppColor.primaryColor,
              valueTitle: AppColor.primaryColor,
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
    Color? valueTitle,
    String? total,
  }) {
    return Row(
      spacing: 5.0,
      children: [
        Text(
          title,
          style: getMediumStyle(color:valueTitle ?? AppColor.darkGreyColor3, fontSize: 14.0),
        ),
        Text(
          (total != null) ? "($total عنصر)" : "",
          style: getMediumStyle(color:valueTitle ??AppColor.darkGreyColor3, fontSize: 11.0),
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
