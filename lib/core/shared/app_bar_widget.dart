import 'package:flutter/material.dart';
import '../style/app_color.dart';
import '../style/app_font_style.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, kToolbarHeight),
      child: AppBar(
        title: Text(title, style: getBoldStyle(color: AppColor.darkGreyColor3)),
        leading:
            leading ??
            Card(
              elevation: 0.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.darkGreyColor2, width: 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.darkGreyColor3,
                ),
              ),
            ),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: actions ?? [],
      ),
    );
  }
}


