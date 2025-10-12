import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';

class ServiceRequestWidget extends StatefulWidget {
  const ServiceRequestWidget({super.key});

  @override
  State<ServiceRequestWidget> createState() => _ServiceRequestWidgetState();
}

class _ServiceRequestWidgetState extends State<ServiceRequestWidget> {
  int indexItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.primaryLightColor.withOpacity(0.2),
      color: Colors.transparent,
      // padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.sizeOf(context).width *0.3,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        indexItem = index;
                      });
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen(),));
                    },
                    child: Card(
                      elevation: 0.0,
                      color: (indexItem == index) ?  AppColor.primaryColor : AppColor.primaryLightColor.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: (indexItem == index) ?  AppColor.primaryColor : AppColor.primaryLightColor.withOpacity(0.2),
                        )
                      ),
                      margin: EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10.0,
                          children: [
                            SizedBox(

                                child: Image.asset(ImageApp.logo,scale: 0.7,
                                  color: (indexItem == index) ? Colors.white : AppColor.primaryLightColor,)).center,

                            Text("اسم الخدمة", style: getBoldStyle(
                                color: (indexItem == index) ? Colors.white : AppColor.primaryLightColor, fontSize: 14.0),),

                          ],
                        ).center,

                      ),
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
