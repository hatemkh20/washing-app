import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';

class ListOfProductRequestWidget extends StatelessWidget {
  const ListOfProductRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
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
                          // Icon(
                          //   Icons.add,
                          //   color: Colors.black,
                          //   size: 15.0,
                          // ),
                          Text(
                            "عدد القطع : ",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "1",
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          // Icon(
                          //   Icons.remove,
                          //   color: Colors.black,
                          //   size: 15.0,
                          // ),
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
}
