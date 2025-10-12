import 'dart:developer';

import 'package:clean_point/core/error/extenstion_refactor_error.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/driver/driver_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/di/di.dart';
import '../../../core/local/flutter_secure_manager.dart';
import '../../../core/local/shared_prefs_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/toast.dart';
import '../cubit/auth_cubit.dart';
import '../data/repository/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;

  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool openSecure = true;

  void deleteToken ()async{
    await FlutterSecureManager.deleteData(key: "token").then((value) => log("Done"),);
    await FlutterSecureManager.deleteData(key: "driver");
    setState(() {

    });
  }
  @override
  void initState() {
    deleteToken();
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    // formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("تسجيل دخول", style: getBoldStyle(color:  AppColor.darkGreyColor3,)),
        scrolledUnderElevation: 0.0,
        actions: [
          TextButton(
            onPressed: () async {
              // await SharedPrefsManager.saveData(
              //   key: "skip",
              //   value: "isSkipping",
              // );
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainScreen,
                    (route) => false,
              );
            },
            child: Text(
              "تخطي",
              style: getBoldStyle(
                color: AppColor.darkGreyColor2,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        centerTitle: true,
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
              children: [
                20.ph,
                Image.asset(
                  ImageApp.login,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                30.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return  "يرجي ارفاق رقم الهاتف";
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
                30.ph,
                TextFieldWidget(
                  validator: (val) {
                    if (val.isEmpty) {
                      return  "يرجي ارفاق كلمة المرور"
                          ;
                    } else if (val.length < 8) {
                      return  "يرجي ارفاق كلمة المرور لا تقل عن 8  احرف او ارقام"
                          ;
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
                5.ph,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      if (!mounted) return;
                      Navigator.pushNamed(context, Routes.forgetScreen);
                    },
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: getBoldStyle(
                        color: AppColor.primaryLightColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        // color: AppColor.primaryColor,
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
                  if (state is LoginSuccess) {
                    if(state.loginModel.data.status.type == 0){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyCodeScreen(
                      //   phone: phoneController.text,
                      // ),));
                      Navigator.pushNamed(context, Routes.otpAccountCodeScreen , arguments: {
                        "phone" : phoneController.text,
                      });
                    }
                    if (state.loginModel.data.role == "user") {
                      await FlutterSecureManager.writeData(
                        key: "token",
                        value: state.loginModel.data.token.toString(),
                      ).then((value) async {
                        toastSuccess(
                          message:
                          state.loginModel.message.toString().isEmpty
                              ? "تم تسجيل الدخول بنجاح"
                              : state.loginModel.message.toString(),
                        );
                        await SharedPrefsManager.removeData(key: "skip");
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.mainScreen,
                              (route) => false,
                        );
                      });
                    }else {
                      await FlutterSecureManager.writeData(
                        key: "token",
                        value: state.loginModel.data.token.toString(),
                      ).then((value) async {
                        toastSuccess(
                          message:
                          state.loginModel.message.toString().isEmpty
                              ? "تم تسجيل الدخول بنجاح"
                              : state.loginModel.message.toString(),
                        );
                        await SharedPrefsManager.removeData(key: "skip");
                        Navigator.pushNamedAndRemoveUntil(context, Routes.mainScreen,(route) => false,);
                      });

                    }
                  }

                  if (state is LoginError) {
                    // state.failure.data?.forEach((key, value) {
                    //   if (key == "phone") {
                    //     toastError(message: "رقم الهاتف غير صحيح");
                    //   } else if (key == "password") {
                    //     toastError(message: "كلمة المرور غير صحيحة");
                    //   }
                    // });
                    toastError(message:
                        (state.failure.data!= null)
                        ? state.failure.getAllErrorMessages()
                        : state.failure.message.toString());
                  }

                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ).center;
                  }
                  return
              ButtonWidgetWithText(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0.0,
                              content: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 20.0,
                                      children: [
                                        Text(
                                           "اختر نوع الحساب",
                                          style: getBoldStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        ButtonWidgetWithText(
                                          onPressed: () {
                                            Navigator.pop(context,"user" );
                                          },
                                          txt:
                                           "مستخدم"
                                              ,
                                          backgroundColor: AppColor.primaryColor,
                                        ),
                                        ButtonWidgetWithText(
                                          onPressed: () {
                                            Navigator.pop(context, 'driver');
                                          },
                                          txt:
                                          "المندوب",
                                          borderColor: AppColor.primaryColor,
                                          backgroundColor: Colors.white,
                                          colorText: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) {
                          if (value != null) {
                            debugPrint("الاختيار: $value");

                            if(value == "user"){
                              context.read<AuthCubit>().loginCubit(
                                phone: phoneController.text,
                                password: passwordController.text,
                                type: value.toString(),
                              ).then((value) {
                                Navigator.pushNamedAndRemoveUntil(context, Routes.mainScreen,(route) => false,);
                              },);

                            }else {
                              context.read<AuthCubit>().loginCubit(
                                phone: phoneController.text,
                                password: passwordController.text,
                                type: value.toString(),
                              ).then((value) {
                                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => DriverMainScreen(),),
                                      (route) => false,);
                              },);

                            }

                          }
                        },);
                      }
                    },
                    txt: "تسجيل دخول",
                    backgroundColor: AppColor.primaryColor,
                  )
    ;
                },
              ),
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ليس لديك حساب؟",
                  style: getBoldStyle(color: Colors.black, fontSize: 16.0),
                ),
                TextButton(
                  onPressed: () {
                    if (!mounted) return;
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                  child: Text(
                    " سجل الآن",
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
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
