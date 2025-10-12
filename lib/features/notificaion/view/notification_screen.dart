import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AppBarWidget(title: "الأشعارات"),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Card(
              elevation: 0.0,
              color: AppColor.darkGreyColor2.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColor.darkGreyColor2.withOpacity(0.2),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.notifications_active_sharp, color:AppColor.primaryColor),
              ),
            ),
            title: Text("اشعار ${index+1}", style: getMediumStyle(color: Colors.black).copyWith(height: 2)),
            subtitle: Text(
              "تفاصيل ${index+1}",
              style: getRegularStyle(color: AppColor.darkGreyColor3).copyWith(height: 2),
            ),
            trailing: Text("5 ساعات", style: getMediumStyle(color: AppColor.darkGreyColor3)),
          );
        },
        separatorBuilder:
            (BuildContext context, int index) =>
                Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
      ),
    );
  }
}
