import 'dart:developer';

import 'package:clean_point/core/di/di.dart';
import 'package:clean_point/core/local/flutter_secure_manager.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/toast.dart';
import 'package:clean_point/features/auth/cubit/auth_cubit.dart';
import 'package:clean_point/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routes.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/global_function.dart';
import '../../../core/utils/image_app.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String checkLang = Localizations.localeOf(context).toString();
    return Column(
      children: [
        30.ph,
        //! Edit Profile
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffebeeff),
            child: Image.asset(ImageApp.editProfile),
          ),
          onTap: () {
            globalCheckSkippingMode(Routes.editProfile);
            // Navigator.pushNamed(context, Routes.editProfile);
          },
          title: Text(
            (checkLang == "ar") ? "تعديل الملف الشخصي" : "Edit Profile",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! Change Password
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffe6f2ff),
            child: Image.asset(ImageApp.password, color: Color(0xff369FFF)),
          ),
          onTap: () {
            globalCheckSkippingMode(Routes.updatePassword);
            // Navigator.pushNamed(context, Routes.updatePassword);
          },
          title: Text(
            (checkLang == "ar") ? "تغيير كلمة المرور" : "Change Password",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! Requests
        // ListTile(
        //   tileColor: Colors.transparent,
        //   trailing: Icon(Icons.arrow_forward_ios),
        //   splashColor: Colors.transparent,
        //   leading: CircleAvatar(
        //     backgroundColor: Color(0xffeaf9f7),
        //     child: Image.asset(ImageApp.requests),
        //   ),
        //   onTap: () {
        //     // globalCheckSkippingMode( Routes.requests);
        //     // Navigator.pushNamed(context, Routes.requests);
        //   },
        //   title: Text((checkLang == "ar") ? "طلباتي" : "My Requests", style: getSemiBoldStyle(color: Colors.black),),
        // ),
        // Divider(color: AppColor.lightGryColor.withOpacity(0.3),),
        //! Wallet
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffe6f2ff),
            child: Image.asset(ImageApp.emptyWallet, color: Color(0xff369FFF)),
          ),
          onTap: () {
            // globalCheckSkippingMode( Routes.myPrescriptions);
            Navigator.pushNamed(context, Routes.walletScreen);
          },
          title: Text(
            (checkLang == "ar") ? "المحفظة" : "Wallet",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! Donation Service
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: AppColor.primaryLightColor.withOpacity(0.1),
            child: Icon(
              Icons.home_repair_service_rounded,
              color: AppColor.primaryLightColor,
            ),
            // child: Image.asset(ImageApp.favourite1),
          ),
          onTap: () {
            // globalCheckSkippingMode( Routes.favourite);
            Navigator.pushNamed(context, Routes.donationServiceScreen);
          },
          title: Text(
            (checkLang == "ar") ? "خدمات التبرع" : "Donation Service",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! About App
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffFFC046).withOpacity(0.1),
            child: Icon(Icons.info_outline, color: Color(0xffFFC046)),
            // child: Image.asset(ImageApp.favourite1),
          ),
          onTap: () {
            // globalCheckSkippingMode( Routes.favourite);
            Navigator.pushNamed(context, Routes.privacyPolicy);
          },
          title: Text(
            (checkLang == "ar") ? "عن التطبيق" : "About App",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! Terms and Conditions
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffFFC046).withOpacity(0.1),
            child: Icon(Icons.info_outline, color: Color(0xffFFC046)),
            // child: Image.asset(ImageApp.favourite1),
          ),
          onTap: () {
            // globalCheckSkippingMode( Routes.favourite);
            Navigator.pushNamed(context, Routes.termsAndConditions);
          },
          title: Text(
            (checkLang == "ar") ? "الشروط والأحكام" : "Terms and Conditions",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        //! Contact Us
        ListTile(
          tileColor: Colors.transparent,
          trailing: Icon(Icons.arrow_forward_ios),
          splashColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Color(0xffFFC046).withOpacity(0.1),
            child: Icon(Icons.phone_locked, color: Color(0xffFFC046)),
            // child: Image.asset(ImageApp.phone , color: Color(0xffFFC046),),
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.contactUs);
            log("message");
          },
          title: Text(
            (checkLang == "ar") ? "اتصل بنا" : "Contact Us",
            style: getSemiBoldStyle(color: Colors.black),
          ),
        ),
        Divider(color: AppColor.lightGryColor.withOpacity(0.3)),
        BlocProvider(
          create:
              (context) => AuthCubit(authRepository: getIt<AuthRepository>()),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LogoutLoading) {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('تسجيل الخروج'),
                      content: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator().center,
                      ),
                    );
                  },
                );
              } else if (state is LogoutSuccess) {
                FlutterSecureManager.deleteData(key: "token");
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginScreen,
                  (route) => false,
                );
                toastSuccess(message: "تم تسجيل الخروج بنجاح");
              } else if (state is LogoutError) {
                Navigator.pop(context);
                toastError(message: state.failure.message.toString());
              }
            },
            builder: (context, state) {
              return ListTile(
                tileColor: Colors.transparent,
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Colors.transparent,
                leading: CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  child: Icon(Icons.logout, color: Colors.red),
                  // child: Image.asset(ImageApp.phone , color: Color(0xffFFC046),),
                ),
                onTap: () async {
                  // Navigator.pushNamed(context, Routes.loginScreen);
                  // log("message");
                  await context.read<AuthCubit>().logoutCubit();
                },
                title: Text(
                  "تسجيل الخروج",
                  style: getSemiBoldStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
