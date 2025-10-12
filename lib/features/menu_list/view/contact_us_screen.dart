import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';


import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../l10n/app_localizations.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var text = AppLocalizations.of(context);
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
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
        title: Text(
          (checkLang == "ar") ? "اتصل بنا" : "Contact Us",
          style: getBoldStyle(color: AppColor.darkGreyColor3, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.all(20.0),
        width: double.maxFinite,
        alignment: Alignment.topCenter,
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
                        ? "يرجي ارفاق الاسم"
                        : "Please attach your name";
                  } else {
                    return null;
                  }
                },
                controller: usernameController,
                // keyBoardType: TextInputType.phone,
                hintText: "ادخل اسمك",
                obscureText: false,
                onChange: (val) {},
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.user),
              ),
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
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.phone),
              ),
              TextFieldWidget(
                validator: (val) {
                  if (val.isEmpty) {
                    return (checkLang == "ar")
                        ? "يرجي ارفاق بريدك الالكتروني"
                        : "Please attach your email";
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                // keyBoardType: TextInputType.phone,
                hintText: "ادخل بريدك الالكتروني",
                obscureText: false,
                onChange: (val) {},
                fillColor: Colors.white,
                prefixIcon: Image.asset(ImageApp.email),
              ),
              TextFieldWidget(
                validator: (val) {
                  if (val.isEmpty) {
                    return (checkLang == "ar")
                        ? "يرجي ارفاق بريدك الالكتروني"
                        : "Please attach your email";
                  } else {
                    return null;
                  }
                },
                controller: messageController,
                // keyBoardType: TextInputType.phone,
                hintText: (checkLang == "ar") ? "نص الرسالة" : "Message text",
                obscureText: false,
                onChange: (val) {},
                minLine: 5,
                maxLine: 7,
                fillColor: Colors.white,
                // prefixIcon: Image.asset(ImageApp.email),
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
            // BlocConsumer<MoreCubit, MoreState>(
            //   listener: (context, state) {
            //     if (state is ContactUsSuccess) {
            //       toastSuccess(message: state.message.toString());
            //       context.pop();
            //     }
            //     if (state is ContactUsError) {
            //       toastWarning(message: state.failure.message.toString());
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is ContactUsLoading) {
            //       return CircularProgressIndicator(
            //         color: AppColor.primaryColor,
            //       ).center;
            //     }
            //     return
                  ButtonWidgetWithText(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // await context.read<MoreCubit>().contactUsCubit(
                      //   name: usernameController.text,
                      //   email: emailController.text,
                      //   phone: phoneController.text,
                      //   message: messageController.text,
                      // );
                    }
                  },
                  txt: (checkLang == "ar") ? "ارسال" : "Send",
                  backgroundColor: AppColor.primaryColor,
                ),
            //   },
            // ),

            15.ph,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    usernameController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
