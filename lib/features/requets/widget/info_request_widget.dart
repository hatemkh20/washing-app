import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';

class InfoRequestWidget extends StatelessWidget {
  final int index;
  const InfoRequestWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color:Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:AppColor.darkGreyColor2.withOpacity(0.2),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            if(index == 2)
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10.0,
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.red,),
                  Text("مستعجل" , style: getBoldStyle(color: Colors.red, fontSize: 16.0),),

                ],
              ),
            //! number invoice and statues
            Row(
              children: [
                Text("#235468729" , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                Spacer(),
                Image.asset((index== 0) ?ImageApp.done : ImageApp.process),
                5.pw,
                Text((index== 0) ? "مكتملة"  : "تحت التنفيذ", style: getMediumStyle(color: Colors.black),),
                30.pw,
              ],
            ),

            //! date and time
            Row(
              children: [
                Image.asset(ImageApp.date),
                5.pw,
                Text("موعد الاستلام : " , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                Text("04:00 م 10/20/2025" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
              ],
            ),

            //! address
            Row(
              children: [
                Image.asset(ImageApp.location2),
                5.pw,
                Text("العنوان : " , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                Expanded(child: Text(" حي اليرموك - الرياض" , style: getMediumStyle(color: AppColor.darkGreyColor2),)),
              ],
            ),

            //! notice
            Row(
              children: [
                Image.asset(ImageApp.note),
                5.pw,
                Text("ملاحظات : " , style: getBoldStyle(color: Colors.black, fontSize: 16.0),),
                Expanded(child: Text(" يوجد ملابس تحتاج تنظيف جاف " , style: getMediumStyle(color: AppColor.darkGreyColor2),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
