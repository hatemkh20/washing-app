import 'package:flutter/material.dart';

import '../style/app_color.dart';
import '../style/app_font_style.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String val) validator;
  final Function(String val) onChange;
  final TextEditingController controller;
  final String hintText;
  final String ?labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? iconDelete;
  final bool? readOnly;
  final Function()? onTap;
  final int? maxLine;
  final int ?minLine;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? errorWidget;
  final TextInputType? keyBoardType;
  final TextAlign? textAlign;

  const TextFieldWidget(
      {super.key,
      required this.validator,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.suffixIcon,
      this.prefixIcon,
        this.labelText,
      this.iconDelete,
      required this.onChange,
      this.readOnly,
      this.onTap,
      this.maxLine ,
      this.minLine = 1,
      this.fillColor,
      this.borderColor,
      this.errorWidget,
      this.keyBoardType,
      this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => validator(val!),
      onChanged: (val) {
        onChange(val);
      },
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      keyboardType: keyBoardType,
      onTap: onTap,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine ?? 1,
      textAlignVertical: TextAlignVertical.center,
      minLines: minLine ?? 1,
      style: getLightStyle(color: Colors.black),
      // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onTapOutside: (event) {
        if (FocusManager.instance.primaryFocus?.context?.mounted ?? false) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? AppColor.lightWhiteColor,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffix: iconDelete,
          hintText: hintText,
          labelText: labelText,
          contentPadding: const EdgeInsets.all(15.0),
          alignLabelWithHint: true,
          // hintStyle: const TextStyle(
          //   fontFamily: 'Cairo',
          //   fontSize: 16.0,
          //   color: AppColor.darkGreyColor2,
          //   fontWeight: FontWeight.w500,
          // ),
          hintStyle: getMediumStyle(color: AppColor.darkGreyColor2),
          labelStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16.0,
            color: AppColor.darkGreyColor2,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: borderColor ?? AppColor.lightGryColor.withOpacity(0.8)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: borderColor ?? AppColor.lightGryColor.withOpacity(0.8)),
          )),
    );
  }
}
