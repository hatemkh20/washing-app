import 'dart:developer';

import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/routing/routes.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/toast.dart';
import '../cubit/auth_cubit.dart';

class VerifyPasswordCodeScreen extends StatefulWidget {
  final String phone;

  const VerifyPasswordCodeScreen({super.key, required this.phone});

  @override
  State<VerifyPasswordCodeScreen> createState() =>
      _VerifyPasswordCodeScreenState();
}

class _VerifyPasswordCodeScreenState extends State<VerifyPasswordCodeScreen> {
  late TextEditingController pinCodeController;
  String? otpCode;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "التحقق من  كلمة المرور",
          style: getBoldStyle(color: AppColor.darkGreyColor3),
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Card(
          elevation: 0.0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.darkGreyColor2, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IconButton(
            onPressed: () {
              if (!mounted) return;
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.darkGreyColor3,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.symmetric(horizontal: 15.0),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageApp.verify,
                height: MediaQuery.sizeOf(context).height * 0.4,
              ),
              10.ph,
              Text(
                "أدخل الرمز المكون من 4 أرقام",
                style: getBoldStyle(color: Colors.black),
              ),
              10.ph,
              Text(
                "${"أدخل الرمز المكون من 4 أرقام الذي وصلك عبر رقم الجوال.".replaceAll(".", "")} ${widget.phone} .",
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(color: AppColor.darkGreyColor2),
              ),
              30.ph,
              PinCodeTextField(
                appContext: context,
                autoFocus: true,
                cursorColor: AppColor.primaryColor,
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: false,
                controller: pinCodeController,
                animationType: AnimationType.scale,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                autoDisposeControllers: true,
                textStyle: TextStyle(color: AppColor.primaryColor),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 55,
                  fieldWidth: 55,
                  borderWidth: 1.5,
                  activeColor: AppColor.primaryLightColor,
                  inactiveColor: AppColor.darkGreyColor3.withOpacity(0.2),
                  inactiveFillColor: Colors.white,
                  // AppColor.darkGreyColor2.withOpacity(
                  //   0.2,
                  // ),
                  activeFillColor: Colors.white,
                  // activeFillColor: AppColor.lightCynColor,
                  selectedColor: AppColor.primaryLightColor,
                  selectedFillColor: Colors.white,
                  inactiveBorderWidth: 2.0,
                  activeBorderWidth: 2.0,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (submittedCode) {
                  otpCode = submittedCode;
                  log("Completed : $otpCode");
                },
                onChanged: (value) {
                  print(value);
                },
              ),
              20.ph,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) async {
                  if (state is VerifyCodeSuccess) {
                    toastSuccess(message: state.message.toString());
                    if (!mounted) return;
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginScreen,
                      (route) => false,
                    );
                  }
                  if (state is VerifyCodeError) {
                    toastError(message: state.failure.message.toString());
                  }
                },
                builder: (context, state) {
                  if (state is VerifyCodeLoading) {
                    return CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ).center;
                  }
                  return ButtonWidgetWithText(
                    onPressed: () {
                      if (pinCodeController.text.isNotEmpty) {
                        context.read<AuthCubit>().verifyCodePasswordCubit(
                          phone: widget.phone,
                          code: pinCodeController.text,
                        );
                        Navigator.pushNamed(context, Routes.changePassword);
                      }
                    },
                    txt: "تحقق",
                    backgroundColor: AppColor.primaryColor,
                  );
                },
              ),

              10.ph,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) async {
                  if (state is ResendCodeSuccess) {
                    toastSuccess(message: state.message.toString());
                  }
                  if (state is ResendCodeError) {
                    toastError(message: state.failure.message.toString());
                  }
                },
                builder: (context, state) {
                  if (state is ResendCodeLoading) {
                    return CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ).center;
                  }
                  return ButtonWidgetWithText(
                    onPressed: () {
                      context.read<AuthCubit>().resendCodeCubit(
                        phone: widget.phone,
                      );
                    },
                    txt: "اعاده ارسال",
                    colorText: AppColor.primaryLightColor,
                    backgroundColor: Colors.transparent,
                    // backgroundColor: AppColor.primaryLightColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }
}
