import 'package:flutter/material.dart';

import '../style/app_font_style.dart';

class ButtonWidgetWithText extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? colorText;
  final double? sizeText;
  final double? widthButton;
  final double? padding;
  final double? heightButton;

  const ButtonWidgetWithText(
      {super.key,
      required this.onPressed,
      required this.txt,
        this.padding,
        this.heightButton,
      this.borderColor = Colors.transparent,
      required this.backgroundColor,
      this.colorText,
      this.sizeText,
      this.widthButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:heightButton ?? 55,
      width: widthButton ?? double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: borderColor!, width: 1.7))),
        child: Padding(
            padding:  EdgeInsets.all(padding ??10.0),
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: getBoldStyle(color: colorText ?? Colors.white, fontSize: 18.0)
                  .copyWith(fontSize: sizeText ?? 18),
            )
            // TextWidget(
            //   txt: txt,
            //   fontSize: sizeText ?? 15,
            //   color: colorText ?? Colors.white,
            //   // notFontFamily: false,
            // ),
            ),
      ),
    );
  }
}
