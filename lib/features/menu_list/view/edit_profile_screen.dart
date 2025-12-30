import 'dart:developer';
import 'dart:io';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/toast.dart';
import 'package:clean_point/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared/button_widget_with_text.dart';
import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';
import '../../../core/utils/pick_image.dart';
import '../../../l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  String? imageUrl;
  String? imageFile;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    context.read<AuthCubit>().getProfileCubit();
    super.initState();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.darkGreyColor3,
            ),
          ),
        ),
        title: Text(
          (checkLang == "ar") ? "تعديل الملف الشخصي" : "Edit Profile",
          style: getBoldStyle(color: AppColor.darkGreyColor3, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.all(20.0),
        width: double.maxFinite,

        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is GetProfileLoading) {
              return CircularProgressIndicator(
                color: AppColor.primaryColor,
              ).center;
            }
            if (state is GetProfileError) {
              return Text(
                state.failure.message.toString(),
                style: getMediumStyle(color: Colors.red),
              ).center;
            }
            if (state is GetProfileSuccess) {
              usernameController.text =
                  state.profileModel.data.profile.name.toString();
              phoneController.text =
                  state.profileModel.data.profile.phone.toString();
              emailController.text =
                  state.profileModel.data.profile.email.toString();
              imageUrl = state.profileModel.data.profile.image.toString();
            }
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20.0,

                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 60.0,
                        // backgroundImage:
                        //     (imageUrl != null || imageUrl!.isNotEmpty)
                        //         ? NetworkImage(imageUrl.toString())
                        // : AssetImage(ImageApp.profile),
                        child: CircleAvatar(
                          backgroundColor: AppColor.primaryLightColor,
                          radius: 57.0,
                          backgroundImage:
                              (imageFile != null)
                                  ? FileImage(File(imageFile.toString()))
                                  : (imageUrl?.isEmpty == true)
                                  ? AssetImage(ImageApp.profile)
                                  : NetworkImage(imageUrl.toString()),
                          // child:(imageUrl != null) ? Image.file(File(imageUrl.toString()),) : Icon(Icons.person),
                          // child: (imageFile != null) ? Container() : Image.network(imageUrl.toString() , fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                          //   return Icon(CupertinoIcons.person,size: 35.0,);
                          // },),
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          radius: 18.0,
                          child: CircleAvatar(
                            backgroundColor: AppColor.darkGreyColor4,
                            radius: 16.0,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await pick(ImageSource.camera).then(
                                              (value) {
                                                setState(() {
                                                  imageFile = value.path;
                                                });
                                                log(imageFile.toString());
                                                context.pop();
                                              },
                                            );
                                          },
                                          icon: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 3.0,
                                            children: [
                                              Icon(
                                                Icons.camera_enhance,
                                                size: 50.0,
                                                color: AppColor.primaryColor,
                                              ),
                                              Text(
                                                "الكاميرا",
                                                style: getMediumStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            await pick(
                                              ImageSource.gallery,
                                            ).then((value) {
                                              setState(() {
                                                imageFile = value.path;
                                              });
                                              log(imageFile.toString());
                                              context.pop();
                                            });
                                          },
                                          icon: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 3.0,
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 50.0,
                                                color: AppColor.primaryColor,
                                              ),
                                              Text(
                                                "الاستوديو",
                                                style: getMediumStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "اسم المستخدم",
                    style: getSemiBoldStyle(color: Colors.black),
                  ),
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
                ],
              ),
            );
          },
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
                if (state is UpdateProfileSuccess) {
                  toastSuccess(message: state.message.toString());
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.mainScreen,
                    (route) => false,
                  );
                } else if (state is UpdateProfileError) {
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
                if (state is UpdateProfileLoading) {
                  return CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ).center;
                }

                return ButtonWidgetWithText(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await context.read<AuthCubit>().updateProfileCubit(
                        name: usernameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        avatar:(imageFile != null) ? File(imageFile.toString()) : null,
                      );
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
    phoneController.dispose();
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
