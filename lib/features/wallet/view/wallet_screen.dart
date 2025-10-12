import 'package:clean_point/core/shared/button_widget_with_icon.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/text_filed_widget.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  final TextEditingController _balanceController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

  }

  void _formatCurrency() {
    if (_isEditing) return;
    _isEditing = true;

    String text = _balanceController.text.replaceAll('ر.س', '').trim();

    if (text.isNotEmpty) {
      _balanceController.text = '$text ر.س';
      _balanceController.selection = TextSelection.fromPosition(
        TextPosition(offset: text.length), // يرجع المؤشر قبل "ر.س"
      );
    }

    _isEditing = false;
  }

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        leading: Card(
          elevation: 0.0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        title: Text(
          "المحفظة",
          style: getBoldStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        // height: MediaQuery.sizeOf(context).height /1,
        decoration: BoxDecoration(
          color:  AppColor.primaryColor,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height *0.18,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    // borderRadius: BorderRadius.only(topRight: Radius.circular(20.0) ,topLeft: Radius.circular(20.0)  ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height/1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0) ,topLeft: Radius.circular(20.0)  ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height *0.23,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                spreadRadius: 5, // How much the shadow spreads
                                blurRadius: 7, // How blurry the shadow is
                                offset: Offset(0, 3), // Offset of the shadow (x, y)
                              ),
                            ]
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("رصيدك الحالي", style: getMediumStyle(color: Colors.black,fontSize: 18.0),),
                            Text("100 رس", style: getMediumStyle(color: AppColor.darkGreyColor2,fontSize: 18.0),),
                            7.ph,
                            Align(
                              alignment: Alignment.topLeft,
                              child: ButtonWidgetWithIcon(
                                onPressed: () {
                                  print("555");
                                  _balanceController.addListener(_formatCurrency);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0,
                                          content: SizedBox(
                                            width: MediaQuery.sizeOf(context).width * 0.9,
                                            // height: MediaQuery.sizeOf(context).height * 0.33,
                                            child: Card(
                                              elevation: 0.0,
                                              color: Colors.white,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  spacing: 20.0,
                                                  children: [
                                                    Text("أضف المبلغ الذي تريده", style: getSemiBoldStyle(color: Colors.black,fontSize: 18.0),),

                                                    SizedBox(
                                                      width: 140,
                                                      height: 50.0,
                                                      child: TextFieldWidget(
                                                        validator: (val) {
                                                          if (val.isEmpty) {
                                                            return  "يرجي ارفاق قيمة الرصيد";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        textAlign: TextAlign.center,
                                                        controller: _balanceController,
                                                        hintText: "ادخل الرصيد",
                                                        obscureText: false,
                                                        borderColor: AppColor.primaryColor,
                                                        keyBoardType: TextInputType.number,
                                                        minLine: 1,
                                                        onChange: (val) {},
                                                        // prefixIcon: Image.asset(ImageApp.password),

                                                      ),
                                                    ),
                                                    ButtonWidgetWithIcon(
                                                      onPressed: () {
                                                        // Navigator.pop(context,"balance" );
                                                        Navigator.pop(context, _balanceController.text);
                                                      },
                                                      txt: " اضافة رصيد",
                                                      color: AppColor.primaryColor,
                                                      iconData: Icons.add,
                                                      heightButton: 42,
                                                      widthButton: 142,
                                                      txtSize: 14.0,
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) {
                                      _balanceController.clear();
                                      // if (value != null) {
                                      //   debugPrint("الاختيار: $value");
                                      //
                                      //   if(value == "user"){
                                      //     context.read<AuthCubit>().loginCubit(
                                      //       phone: phoneController.text,
                                      //       password: passwordController.text,
                                      //       type: value.toString(),
                                      //     );
                                      //   }else {
                                      //     context.read<AuthCubit>().loginDoctorCubit(
                                      //       phone: phoneController.text,
                                      //       password: passwordController.text,
                                      //       type: value.toString(),
                                      //     );
                                      //   }
                                      //
                                      // }
                                    },);
                                },
                                txt: " اضافة رصيد",
                                color: AppColor.primaryColor,
                                iconData: Icons.add,
                                heightButton: 42,
                                widthButton: 142,
                                txtSize: 14.0,
                              ),
                            ),

                          ],
                        ),
                      ),
                      IgnorePointer(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height *0.33,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                          ),
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                             decoration: BoxDecoration(
                               color: Colors.amber,
                               shape: BoxShape.circle,
                             ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //! Loyal Points
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                                color: AppColor.lightBlueColor.withOpacity(0.7),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10.0,
                                  children: [
                                    Text("نقاط الولاء" , style: getBoldStyle(color: AppColor.primaryColor, fontSize: 16.0),),
                                    RichText(
                                        text: TextSpan(
                                        children: [
                                          TextSpan(text: "رصيد النقاط :",style: getMediumStyle(color: Colors.black)),
                                          TextSpan(text: " 12 نقطة",style: getMediumStyle(color: AppColor.darkGreyColor3)),
                                        ],
                                    ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(text: "يعادل : ",style: getMediumStyle(color: Colors.black)),
                                          TextSpan(text: "24 ريال(خصم أو رصيد).",style: getMediumStyle(color: AppColor.darkGreyColor3)),
                                        ],
                                      ),
                                    ),
                                    ButtonWidgetWithText(
                                      onPressed: () {},
                                      txt: "استبدال النقاط",
                                      heightButton: 42,
                                      widthButton: 142,
                                      sizeText: 14.0,
                                      padding: 0.0,
                                      backgroundColor: Colors.transparent,
                                      borderColor: AppColor.primaryColor,
                                      colorText: AppColor.primaryColor,
                                    ),
                                    Text('زر "استبدال النقاط" → يخصم من الفاتورة الجاية أو يتحول لرصيد المحفظة.',
                                      style: getMediumStyle(color: AppColor.darkGreyColor3, fontSize: 14.0),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //! reference for withdrew and deposit
                          SizedBox(
                            width: double.infinity,
                            // height: MediaQuery.sizeOf(context).height / 1,
                            child: Card(
                              color: Colors.transparent,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                                 side: BorderSide(
                                   color: AppColor.darkGreyColor4,
                                 )
                               ),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 10.0,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("الحركات المالية" , style: getBoldStyle(color: AppColor.primaryColor, fontSize: 16.0),),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 35.0,
                                                width: 35.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (index % 2 == 0) ?
                                                    AppColor.primaryColor.withOpacity(0.2): AppColor.yellowLight ,
                                                ),
                                                child: Image.asset(
                                                    (index % 2 == 0) ? ImageApp.deposit : ImageApp.withdrew,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              ),
                                              20.pw,
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(text: "دفع فاتورة\n",style: getSemiBoldStyle(color: Colors.black, fontSize: 16.0)),
                                                    TextSpan(text: "24 ريال",style: getMediumStyle(color: AppColor.darkGreyColor3)),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Text( "منذ يومين",style: getMediumStyle(color: AppColor.darkGreyColor3)),
                                            ],
                                          ),
                                        );
                                      },),
                                  ],
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
