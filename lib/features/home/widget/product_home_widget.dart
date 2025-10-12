import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/button_widget_with_icon.dart';
import '../../../core/utils/image_app.dart';

class ProductHomeWidget extends StatelessWidget {
  const ProductHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("منتجات للغسيل", style: getBoldStyle(color: Colors.black),),
              TextButton(onPressed: () {

              }, child: Text("عرض الكل", style: getSemiBoldStyle(color: AppColor.darkGreyColor3).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                fontSize: 16.0,
              ),),)
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.sizeOf(context).width *0.45,
                child: Card(
                  elevation: 0.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10.0,
                          children: [
                            10.ph,
                            SizedBox(
                                // height: 80.0,
                                // width: 80.0,
                                child: Image.asset(ImageApp.logo,scale: 0.7,)).center,

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
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
