import 'dart:developer';

import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/auth/data/model/user_date_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/toast.dart';
import '../../../l10n/app_localizations.dart';
import '../cubit/auth_cubit.dart';
import '../data/repository/auth_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool openSecure = true;
  bool checkBox = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    // formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    var text = AppLocalizations.of(context);
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text(
          "حساب جديد",
          style: getBoldStyle(color: AppColor.darkGreyColor3),
        ),
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
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 25.0,
              children: [
                // 20.ph,
                Image.asset(
                  ImageApp.signup,
                  height: MediaQuery.sizeOf(context).height * 0.23,
                ),
                // 20.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "يرجي ارفاق الاسم";
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                  // keyBoardType: TextInputType.phone,
                  hintText: "ادخل اسمك" + " *",
                  obscureText: false,
                  onChange: (val) {},
                  prefixIcon: Image.asset(ImageApp.user),
                ),
                // 20.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "يرجي ارفاق رقم الجوال";
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController,
                  keyBoardType: TextInputType.phone,
                  hintText: "ادخل رقم الجوال" + " *",
                  obscureText: false,
                  onChange: (val) {},
                  prefixIcon: Image.asset(ImageApp.phone),
                ),
                // 20.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "يرجي ارفاق بريدك الالكتروني";
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  // keyBoardType: TextInputType.phone,
                  hintText: "ادخل بريدك الالكتروني",
                  obscureText: false,
                  onChange: (val) {},
                  prefixIcon: Image.asset(ImageApp.email),
                ),
                // 20.ph,
                // TextFieldWidget(
                //   validator: (val) {
                //     if (val.isEmpty) {
                //       return "يرجي ارفاق ادخل العنوان"
                //           ;
                //     } else {
                //       return null;
                //     }
                //   },
                //   controller: addressController,
                //   // keyBoardType: TextInputType.phone,
                //   hintText: "ادخل العنوان",
                //   obscureText: false,
                //   maxLine: 2,
                //   onChange: (val) {},
                //   prefixIcon: Image.asset(ImageApp.map),
                // ),
                // 20.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "يرجي ارفاق كلمة المرور";
                    } else if (val.length < 8) {
                      return "يرجي ارفاق كلمة المرور لا تقل عن 8 احرف او ارقام";
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  hintText: "ادخل كلمة المرور",
                  obscureText: openSecure,
                  onChange: (val) {},
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
                // 5.ph,
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        value: checkBox,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        activeColor: AppColor.primaryColor,
                        side: BorderSide(
                          color: AppColor.darkGreyColor2,
                          width: 1.7,
                        ),
                        fillColor: WidgetStateProperty.all(
                          checkBox ? null : Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            checkBox = value!;
                          });
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.privacyPolicy);
                      },
                      child: Text(
                        "أوافق على الشروط والأحكام",
                        style: getSemiBoldStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ).copyWith(
                          decorationColor: AppColor.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
            BlocProvider(
              create:
                  (context) =>
                      AuthCubit(authRepository: getIt<AuthRepository>()),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) async {
                  if (state is CheckUserSuccess) {
                    if (state.message.data.emailExists) {
                      toastError(message: "الايميل هذا مستخدم من قبل");
                    } else if (state.message.data.phoneExists) {
                      toastError(message: "رقم الهاتف هذا مستخدم من قبل");
                    } else {
                      toastSuccess(message: "تم بنجاح");
                      final user = UserDataRequest(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        address:
                            addressController.text.isEmpty
                                ? ""
                                : addressController.text,
                        password: passwordController.text,
                      );
                      Navigator.pushNamed(
                        context,
                        Routes.otpAccountCodeScreen,
                        arguments: {"phone": user.phone, "user": user},
                      );
                    }
                  }
                  if (state is CheckUserError) {
                    state.failure.data?.forEach((key, value) {
                      if (key == "phone") {
                        toastError(message: "رقم الهاتف هذا مستخدم من قبل");
                      } else if (key == "email") {
                        toastError(message: "الايميل هذا مستخدم من قبل");
                      }
                    });
                    toastError(message: state.failure.message.toString());
                  }
                },
                builder: (context, state) {
                  if (state is CheckUserLoading) {
                    return CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ).center;
                  }
                  return ButtonWidgetWithText(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (checkBox) {
                          final user = UserDataRequest(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address:
                                addressController.text.isEmpty
                                    ? ""
                                    : addressController.text,
                            password: passwordController.text,
                          );
                          log(user.toString());
                          // context.read<AuthCubit>().registerCubit(
                          //   user: UserDataRequest(
                          //     name: nameController.text,
                          //     email: emailController.text,
                          //     phone: phoneController.text,
                          //     address: addressController.text,
                          //     password: passwordController.text,
                          //   ),
                          // );
                          context.read<AuthCubit>().checkUserCubit(
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                        } else {
                          toastWarning(
                            message: "يرجي الموافقة علي الشروط والاحكام",
                          );
                        }
                      }
                    },
                    txt: "حساب جديد",
                    backgroundColor: AppColor.primaryColor,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لديك حساب؟ ",
                  style: getBoldStyle(color: Colors.black, fontSize: 16.0),
                ),
                TextButton(
                  onPressed: () {
                    if (!mounted) return;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: getBoldStyle(
                      color: AppColor.primaryLightColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            15.ph,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    // formKey.currentState!.dispose();
    super.dispose();
  }
}
