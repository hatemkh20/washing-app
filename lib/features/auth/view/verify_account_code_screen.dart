import 'dart:developer';

import 'package:clean_point/core/local/flutter_secure_manager.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/auth/data/model/user_date_request.dart';
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

class VerifyAccountCodeScreen extends StatefulWidget {
  final String phone;
  final UserDataRequest? user;
  const VerifyAccountCodeScreen({super.key, required this.phone, this.user});

  @override
  State<VerifyAccountCodeScreen> createState() =>
      _VerifyAccountCodeScreenState();
}

class _VerifyAccountCodeScreenState extends State<VerifyAccountCodeScreen> {
  late TextEditingController pinCodeController;
  String? otpCode;

  @override
  void initState() {
    context.read<AuthCubit>().verifyCodeCubit(phone: widget.phone).then((
      value,
    ) {
      log('verify account code screen');
    });
    super.initState();

    pinCodeController = TextEditingController();
    // pinCodeController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.phone);
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text(
          "التحقق من الحساب",
          style: getBoldStyle(color: AppColor.darkGreyColor3),
        ),
        scrolledUnderElevation: 0.0,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        // decoration: BoxDecoration(
        //   color: AppColor.background,
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(40.0),
        //     topLeft: Radius.circular(40.0),
        //   ),
        // ),
        child:
        // BlocProvider(
        //   create: (context) =>
        //       AuthCubit(authRepository: getIt<AuthRepository>()),
        //   child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return (state is VerifyCodeLoading)
                    ? Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10.0,
                      children: [
                        Text(
                          'في انتظار ارسال كود التفعيل....',
                          style: getMediumStyle(color: AppColor.redColor),
                        ),
                        CircularProgressIndicator().center,
                      ],
                    )
                    : Container();
              },
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Text(
                          'في انتظار تسجيل الحساب',
                          style: getMediumStyle(color: AppColor.primaryColor),
                        ),
                        content: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator().center,
                        ),
                      );
                    },
                  );
                }
                if (state is RegisterSuccess) {
                  FlutterSecureManager.writeData(
                    key: "token",
                    value: state.message.data.user.token.toString(),
                  );
                  toastSuccess(message: state.message.message.toString());
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.mainScreen,
                    (route) => false,
                  );
                  // Navigator.pop(context);
                }
                if (state is RegisterError) {
                  Navigator.pop(context);
                  toastError(message: state.failure.message.toString());
                }
              },
              child: SizedBox.shrink(),
            ),
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
                if (state is VerifyCodePasswordSuccess) {
                  toastSuccess(message: state.message.toString());
                  // if (!mounted) return;
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   Routes.mainScreen,
                  //   (route) => false,
                  // );
                  if (widget.user != null) {
                    context.read<AuthCubit>().registerCubit(user: widget.user!);
                  } else {
                    toastSuccess(message: "تم التحقق من الحساب بنجاح");
                    Navigator.pushNamed(context, Routes.changePassword);
                  }

                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext dialogContext) {
                  //     return AlertDialog(
                  //       title: const Text('في انتظار ارسال كود التفعيل'),
                  //       content: SizedBox(
                  //         width: 100,
                  //         height: 100,
                  //         child:
                  //             Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 const Text('في انتظار تسجيل الحساب'),
                  //                 CircularProgressIndicator(),
                  //               ],
                  //             ).center,
                  //       ),
                  //     );
                  //   },
                  // );
                }
                if (state is VerifyCodePasswordError) {
                  toastError(message: state.failure.message.toString());
                }
              },
              builder: (context, state) {
                if (state is VerifyCodePasswordLoading) {
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
                if (state is VerifyCodeSuccess) {
                  toastSuccess(message: state.message.toString());
                }
                if (state is VerifyCodeError) {
                  toastError(message: state.failure.message.toString());
                }
              },
              builder: (context, state) {
                if (state is VerifyCodeLoading2) {
                  return CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ).center;
                }
                return ButtonWidgetWithText(
                  onPressed: () {
                    context.read<AuthCubit>().verifyCodeCubit(
                      phone: widget.phone,
                      isLoading2: true,
                    );
                  },
                  txt: "اعاده ارسال",
                  backgroundColor: AppColor.primaryLightColor,
                );
              },
            ),
          ],
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
