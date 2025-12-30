import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/shared/button_widget_with_icon.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/home/data/model/home_model.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_font_style.dart';

class PackageSubscribtionWidget extends StatelessWidget {
  final HomeModel homeModel;
  const PackageSubscribtionWidget({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1,
      color: AppColor.lightBlueColor,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20.0,
        children: [
          Text("باقات الاستراك", style: getBoldStyle(color: Colors.black)),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: homeModel.data.home.packages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = homeModel.data.home.packages[index];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.all(0.0),
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: AppColor.blueDark,
                          alignment: Alignment.center,
                          height: 55.0,
                          width: MediaQuery.sizeOf(context).width / 1,
                          child: Text(
                            // "الباقة الاساسية",
                            item.title,
                            style: getBoldStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          width: MediaQuery.sizeOf(context).width / 1,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10.0,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Column(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: List.generate(
                              //     item.features.length - 1,
                              //     (index) => Text(
                              //       item.features[index],
                              //       style: getSemiBoldStyle(
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Text(
                                item.features.first,
                                style: getBoldStyle(color: Colors.black),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 10,
                                children: [
                                  Text(
                                    "${item.price} ريال",
                                    style: getBoldStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  if (item.hasDiscount)
                                    Text(
                                      "/ ${item.discount} ريال ",
                                      style: getBoldStyle(
                                        color: Colors.red,
                                        fontSize: 10.0,
                                      ).copyWith(
                                        decorationColor: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ButtonWidgetWithIcon(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.detailsPackage,
                              arguments: {
                                "id": homeModel.data.home.packages[index].id,
                              },
                            );
                          },
                          widthButton: 150.0,
                          heightButton: 45.0,
                          txt: "اشترك الأن",
                          color: AppColor.primaryLightColor,
                          // iconData: Icons.padding_rounded,
                          iconDataWidget: Image.asset(ImageApp.package),
                        ),
                        10.ph,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
