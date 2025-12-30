import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/toast.dart';
import '../../../l10n/app_localizations.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool openSecure = true;
  bool openSecure2 = true;
  bool openSecure3 = true;

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var text = AppLocalizations.of(context);
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        // backgroundColor: AppColor.primaryColor,
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
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          (checkLang == "ar") ? " تغيير كلمةالمرور" : "Edit Password",
          style: getBoldStyle(color: AppColor.darkGreyColor3, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.all(20.0),
        width: double.maxFinite,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20.0,
            children: [
              TextFieldWidget(
                validator: (val) {
                  if (val.isEmpty) {
                    return (checkLang == "ar")
                        ? "يرجي ارفاق كلمة المرور الحالية"
                        : "Please attach your old password";
                  } else {
                    return null;
                  }
                },
                controller: currentPasswordController,
                hintText:
                    (checkLang == "ar")
                        ? "كلمة المرور الحالية"
                        : "Phone Number",
                obscureText: openSecure,
                onChange: (val) {},
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      openSecure = !openSecure;
                    });
                  },
                  icon:
                      openSecure
                          ? Image.asset(ImageApp.eyeClose)
                          : Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColor.darkGreyColor2,
                          ),
                ),
              ),
              TextFieldWidget(
                validator: (val) {
                  if (val.isEmpty) {
                    return (checkLang == "ar")
                        ? "يرجي ارفاق كلمة المرور الجديدة"
                        : "Please attach your new password";
                  } else {
                    return null;
                  }
                },
                controller: newPasswordController,
                // keyBoardType: TextInputType.phone,
                hintText:
                    (checkLang == "ar")
                        ? "كلمة المرور الجديدة"
                        : "Write New Password",
                obscureText: openSecure2,
                onChange: (val) {},
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      openSecure2 = !openSecure2;
                    });
                  },
                  icon:
                      openSecure2
                          ? Image.asset(ImageApp.eyeClose)
                          : Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColor.darkGreyColor2,
                          ),
                ),
              ),
              TextFieldWidget(
                validator: (val) {
                  if (val.isEmpty) {
                    return (checkLang == "ar")
                        ? "يرجي تأكيد كلمة المرور الجديدة"
                        : "Please attach your confirm new password";
                  } else {
                    return null;
                  }
                },
                controller: confirmNewPasswordController,
                // keyBoardType: TextInputType.phone,
                hintText:
                    (checkLang == "ar")
                        ? "تأكيد كلمة المرور الجديدة"
                        : "Confirm new Password",
                obscureText: openSecure3,
                onChange: (val) {},
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      openSecure3 = !openSecure3;
                    });
                  },
                  icon:
                      openSecure3
                          ? Image.asset(ImageApp.eyeClose)
                          : Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColor.darkGreyColor2,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: AppColor.background,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  toastSuccess(message: state.message.toString());
                  context.pop();
                } else if (state is ResetPasswordError) {
                  toastError(message: state.failure.message.toString());
                  state.failure.data?.forEach((key, value) {
                    toastError(
                      message: value
                          .toString()
                          .replaceAll("[", "")
                          .replaceAll("]", ""),
                    );
                  });
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ).center;
                }
                return ButtonWidgetWithText(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (newPasswordController.text !=
                          confirmNewPasswordController.text) {
                        toastError(message: "كلمة المرور غير متطابقة");
                        return;
                      } else {
                        context.read<AuthCubit>().updatePasswordCubit(
                          currentPassword: currentPasswordController.text,
                          newPassword: newPasswordController.text,
                        );
                      }
                    }
                  },
                  txt: (checkLang == "ar") ? "حفظ" : "Save",
                  backgroundColor: AppColor.primaryColor,
                );
              },
            ),

            15.ph,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    confirmNewPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
