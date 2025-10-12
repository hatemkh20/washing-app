import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverItemDetailsRequest extends StatelessWidget {
  final String? image;
  final IconData ? iconDate;
  final String title;
  final String details;
  final Color ? colorDetails;

  const DriverItemDetailsRequest({
    super.key,
     this.image,
    this.iconDate,
    required this.title,
    required this.details, this.colorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        (image != null) ?
        Image.asset(image!, color: Colors.amber,) : Icon(iconDate , color: Colors.amber,),
        Text(title, style: getBoldStyle(color: Colors.black, fontSize: 15.0)),
        Expanded(
          child: Text(
            details,
            style: getMediumStyle(color:colorDetails ?? AppColor.darkGreyColor2, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
