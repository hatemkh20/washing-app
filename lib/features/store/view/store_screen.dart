import 'package:clean_point/core/shared/button_widget_with_icon.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        // mainAxisSpacing: 10.0,
        //   crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.0,
            color: Colors.white,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  // 10.ph,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.0,
                    children: [
                      SizedBox(
                          height: 80.0,
                          width: 80.0,
                          child: Image.asset(ImageApp.logo),
                      ).center,

                      Text("اسم المنتج", style: getSemiBoldStyle(color: Colors.black, fontSize: 14.0),),
                      Text("20ريال", style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 14.0),),
                      ButtonWidgetWithIcon(
                        onPressed: () {},
                        txt: 'اضافه الي السلة',
                        color: AppColor.primaryColor,
                        iconDataWidget: Image.asset(ImageApp.addCart, color: Colors.white,),
                        txtSize: 10.0,
                        heightButton: 35.0,
                      )
                    ],
                  ),
                  IgnorePointer(
                    child: Image.asset(ImageApp.favourite2, color: Colors.red,),
                  )
                ],
              ).center,

            ),
          );
        },);
  }
}
