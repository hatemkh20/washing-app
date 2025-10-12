import 'package:flutter/material.dart';

import '../style/app_font_style.dart';

class ButtonWidgetWithIcon extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final double? txtSize;
  final Color color;
  final Color? colorDark;
  final Color? colorLight;
  final IconData? iconData;
  final Widget? iconDataWidget;
  final Color? colorText;
  final double? widthButton;
  final double? heightButton;
  final Alignment ? alignment;
  final Color? colorBorder;
  final double? widthBorder;

  const ButtonWidgetWithIcon(
      {super.key,
      required this.onPressed,
      required this.txt,
      this.txtSize,
        this.alignment,
      required this.color,
      this.iconData,
      this.iconDataWidget,
      this.colorDark,
      this.colorLight,
      this.colorText,
      this.widthButton,
      this.colorBorder,
      this.widthBorder,
      this.heightButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightButton ?? 55,
        width: widthButton ?? double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            alignment:alignment?? Alignment.center,
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(
                  color: colorBorder ?? Colors.transparent,
                  width: widthBorder ?? 0.0,
                ),
                borderRadius: BorderRadius.circular(10.0))),
            elevation: WidgetStateProperty.all(0.0),
          ),
          icon: iconDataWidget ??
              Icon(
                iconData,
                color: Colors.white,
              ),
          label: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(txt,
                style: getSemiBoldStyle(
                  color: colorText ?? Colors.white,
                ).copyWith(fontSize: txtSize ?? 15)),
          ),
        ));
  }
}
