import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/features/requets/view/invoice_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../widget/addition_service_widget.dart';
import '../widget/recieve_and_date_widget.dart';
import '../widget/search_of_product_widget.dart';
import '../widget/service_request_widget.dart';

class AddRequestsScreen extends StatelessWidget {
  const AddRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "أضافة طلب"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.0,
          children: [
            Text("اختر نوع الخدمة", style: getBoldStyle(color: Colors.black),),
            ServiceRequestWidget(),
            ReceiveAndDateWidget(),
            SearchOfProductWidget(),
            AdditionServiceWidget(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestIsProcessScreen(),));
            Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceScreen(),));
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 1,
            height: MediaQuery.sizeOf(context).height * 0.08,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Text("ارسال الطلب", style: getBoldStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
