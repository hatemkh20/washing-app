import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/home/cubit/home_cubit.dart';
import 'package:clean_point/features/home/data/model/package_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/style/app_color.dart';
import '../../core/style/app_font_style.dart';

class DetailsPackageScreen extends StatefulWidget {
  const DetailsPackageScreen({super.key});

  @override
  State<DetailsPackageScreen> createState() => _DetailsPackageScreenState();
}

class _DetailsPackageScreenState extends State<DetailsPackageScreen> {
  String? selectedValue;

  final List<String> items = ["Visa", "Mastercard", "Mada"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "تفاصيل الباقة"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is PackageDetailsLoading) {
            return CircularProgressIndicator().center;
          } else if (state is PackageDetailsError) {
            return Text(
              state.failure.message.toString(),
              style: getMediumStyle(color: Colors.red),
            ).center;
          } else if (state is PackageDetailsSuccess) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.0,
                children: [
                  //! card details
                  _cardDetails(packageDetailsModel: state.packageDetailsModel),
                  //! list features
                  Text(
                    "مميزات الباقه",
                    style: getBoldStyle(color: Colors.black),
                  ),
                  _listFeatures(packageDetailsModel: state.packageDetailsModel),
                  //! type of payment
                  Text("طريقه الدفع", style: getBoldStyle(color: Colors.black)),
                  _dropDown(),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.sizeOf(context).width / 1,
            height: MediaQuery.sizeOf(context).height * 0.08,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Text(
              "تأكيد الاشتراك",
              style: getBoldStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  //! card details
  Widget _cardDetails({required PackageDetailsModel packageDetailsModel}) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColor.blueDark,
            alignment: Alignment.center,
            height: 55.0,
            width: MediaQuery.sizeOf(context).width / 1,
            child: Text(
              packageDetailsModel.data.package.title,
              style: getBoldStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 1,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.0,
              children: [
                Text(
                  "${packageDetailsModel.data.package.price} ريال",
                  style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                ),
                Text(
                  "بدلا من ${packageDetailsModel.data.package.discount} ريال",
                  style: getBoldStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                  ).copyWith(
                    decorationColor: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1.5,
                  ),
                ),
                Row(
                  spacing: 7.0,
                  children: [
                    Image.asset(ImageApp.orders),
                    Text(
                      "${packageDetailsModel.data.package.ordersCount} طلبات",
                      style: getMediumStyle(
                        color: AppColor.darkGreyColor2,
                        fontSize: 17.0,
                      ),
                    ),
                    Spacer(),
                    Image.asset(ImageApp.duration),
                    Text(
                      "${packageDetailsModel.data.package.durationDays} يوم",
                      style: getMediumStyle(
                        color: AppColor.darkGreyColor2,
                        fontSize: 17.0,
                      ),
                    ),
                    70.pw,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //! list features
  Widget _listFeatures({required PackageDetailsModel packageDetailsModel}) {
    List<String> details = [
      "توصيل مجاني لأول مرتين",
      "خصم 50% على خدمة المستعجل",
      "إمكانية إضافة رائحة مجانية",
      "صلاحية لمدة شهر كامل",
    ];
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          spacing: 10.0,
          children: [
            Icon(Icons.verified_rounded, color: AppColor.primaryLightColor),
            Text(
              packageDetailsModel.data.package.features[index],
              style: getSemiBoldStyle(
                color: AppColor.darkGreyColor3,
                fontSize: 17.0,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => 15.ph,
      itemCount: packageDetailsModel.data.package.features.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  //! type of payment
  Widget _dropDown() {
    return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          elevation: 0,
          hint: Text(
            "اختر طريقة الدفع",
            style: getMediumStyle(
              color: AppColor.darkGreyColor3,
              fontSize: 16.0,
            ),
          ),
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200], // 🎨 هنا الـ fillColor
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColor.darkGreyColor2.withOpacity(0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColor.darkGreyColor2.withOpacity(0.1),
                width: 1.5,
              ), // ✅ Border عادي
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColor.darkGreyColor2.withOpacity(0.1),
                width: 2,
              ), // ✅ Border لما يتعمل Focus
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 17,
            ),
          ),
          // hint: const Text("اختر طريقة الدفع"),
          items:
              items.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
