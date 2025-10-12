
import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/toast.dart';
import '../../../l10n/app_localizations.dart';
import '../cubit/auth_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController phoneController;


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool filed1 = true;
  bool filed2 = true;
  String? otpCode;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    var text = AppLocalizations.of(context);
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("نسيت كلمة المرور", style: getBoldStyle(color: AppColor.darkGreyColor3)),
        leading: Card(
          elevation: 0.0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColor.darkGreyColor2,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IconButton(
            onPressed: () {
              if (!mounted) return;
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color:AppColor.darkGreyColor3),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery
            .sizeOf(context)
            .height / 1,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.ph,
                Image.asset(
                  ImageApp.forget,
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.3,
                ),
                20.ph,
                Text(
                "لا تقلق! الرجاء إدخال رقم الجوال المرتبط بحسابك.",
                  style: getSemiBoldStyle(
                    color: AppColor.darkGreyColor3,
                    fontSize: 20.0,
                  ),
                ),
                30.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return (checkLang == "ar")
                          ? "يرجي ارفاق رقم الهاتف"
                          : "Please attach your phone number";
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController,
                  keyBoardType: TextInputType.phone,
                  hintText: "ادخل رقم الجوال",
                  obscureText: false,
                  onChange: (val) {},
                  prefixIcon: Image.asset(ImageApp.phone),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        // color: AppColor.background,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) async {
                if (state is ForgetPasswordSuccess) {
                  toastSuccess(message: state.message.toString());
                  if (!mounted) return;
                  Navigator.pushNamed(context, Routes.otpPasswordCodeScreen , arguments: {
                    "phone" : phoneController.text,
                  });
                }
                if (state is ForgetPasswordError) {
                  toastError(message: state.failure.message.toString());
                }
              },
              builder: (context, state) {
                if (state is ForgetPasswordLoading) {
                  return CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ).center;
                }
                return
                  ButtonWidgetWithText(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgetPasswordCubit(
                        phone: phoneController.text,
                      );

                    }
                  },
                  txt: "استمرار",
                  backgroundColor: AppColor.primaryColor,
                );
              },
            ),
            30.ph,
          ],
        ),
      ),
    );
  }




  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
