import 'dart:developer';
import 'package:clean_point/core/utils/toast.dart';
import 'package:clean_point/features/store/data/model/cart_model.dart';
import 'package:clean_point/features/store/data/model/checkout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:clean_point/core/shared/app_bar_widget.dart';
import 'package:clean_point/core/shared/button_widget_with_text.dart';
import 'package:clean_point/core/shared/text_filed_widget.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/di/di.dart';
import '../../../core/style/app_color.dart';
import '../../store/cubit/store_cubit.dart';
import '../../store/data/repository/store_repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _controller = TextEditingController();

  int? selectedIndex;

  String? selectedValue;

  final List<String> items = [
    "Visa",
    "Mastercard",
    "Mada",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: "السلة"),
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => StoreCubit(storeRepository: getIt<StoreRepository>())..getCartCubit(),)
      ], child: BlocConsumer<StoreCubit, StoreState>(
          buildWhen: (previous, current) =>
          current is GetCartSuccess ||
              current is GetCartError,
          // listenWhen: (previous, current) =>
          // current is AddStoreSuccess ||
          //     current is AddStoreError,
          listener: (context, state) {
            if(state is GetCartSuccess){
              context.read<StoreCubit>()..checkoutCartCubit(coupon:  _controller.text.isNotEmpty ? _controller.text : null);
            }
            if(state is UpdateCartLoading){
              showDialog(context: context, builder: (context) {
                return CircularProgressIndicator().center;
              },);
            }else if (state is UpdateCartSuccess) {
              context.read<StoreCubit>()..checkoutCartCubit(coupon:  _controller.text.isNotEmpty ? _controller.text : null);
              Navigator.pop(context);
            }

            else if(state is DeleteCartError){
              Navigator.pop(context);
              toastError(message: state.failure.message.toString());
            }

            if(state is DeleteCartLoading){
              showDialog(context: context, builder: (context) {
                return CircularProgressIndicator().center;
              },);
            }else if (state is DeleteCartSuccess) {
              context.read<StoreCubit>()..checkoutCartCubit(coupon:  _controller.text.isNotEmpty ? _controller.text : null);
              Navigator.pop(context);
            }

            else if(state is UpdateCartError){
              Navigator.pop(context);
              toastError(message: state.failure.message.toString());
            }
          },
          builder: (context, state) {
        if(state is GetCartLoading){
          return CircularProgressIndicator().center;
        }else if(state is GetCartSuccess){
          if(state.cartModel.data.cartItems.isEmpty){
            return Icon(Icons.remove_shopping_cart , size: 120,).center;
          }
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.0,
              children: [
                //! List Of Product
                _listOfProduct(state.cartModel),
                // Card(
                //   elevation: 0.0,
                //   color: AppColor.primaryLightColor.withOpacity(0.1),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       spacing: 10.0,
                //       children: [
                //         RotatedBox(
                //           quarterTurns: 90,
                //           child: Switch(
                //             activeColor: Colors.white,
                //             activeTrackColor:AppColor.primaryColor ,
                //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //             value: true, onChanged: (value) {
                //           },),
                //         ),
                //         Text(
                //           "مستعجل",
                //           style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 15.0),
                //         ),
                //         Spacer(),
                //         RotatedBox(
                //           quarterTurns: 90,
                //           child: Switch(
                //             activeColor: Colors.white,
                //             activeTrackColor:AppColor.primaryColor ,
                //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //             value: true, onChanged: (value) {
                //           },),
                //         ),
                //         Text(
                //           "تعطير برائحة الزهور",
                //           style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 15.0),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                //! Address
                SizedBox(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width / 1,
                  child: Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(),
                    color: AppColor.darkGreyColor2.withOpacity(0.1),
                    child:
                    Text(
                      "العنوان",
                      style: getMediumStyle(color: Colors.black),
                    ).center,
                  ),
                ),
                Row(
                  spacing: 10.0,
                  children: [
                    Image.asset(ImageApp.location2, color: Colors.amber),
                    Expanded(
                      child: Text(
                        "التوصيل الي : الرياض , حي العليا , شارغ التحلية",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: getMediumStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),

                _applyCoupon(),
                //! Start Date
                // Text(
                //   "موعد الاستلام",
                //   style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                // ),
                // ListTile(
                //   tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
                //   onTap: () async {
                //     await showDatePicker(
                //       context: context,
                //       firstDate: DateTime.now(),
                //       lastDate: DateTime(2050),
                //     ).then((value) async {
                //       log("${value?.day} ");
                //       if (value != null) if (!mounted) true;
                //       await showTimePicker(
                //         context: context,
                //         helpText: "اختر وقت البداية",
                //         initialTime: TimeOfDay.now(),
                //       ).then((value) async {
                //         if (!mounted) true;
                //         await showTimePicker(
                //           context: context,
                //           helpText: "اختر وقت النهاية",
                //           initialTime: TimeOfDay.now(),
                //         );
                //       });
                //     });
                //   },
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //     // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
                //   ),
                //   leading: Image.asset(ImageApp.calendar),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios_rounded,
                //     color: AppColor.darkGreyColor2,
                //   ),
                //   contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
                //   title: Text(
                //     "اختر التاريخ والوقت",
                //     style: getMediumStyle(
                //       color: AppColor.darkGreyColor2,
                //       fontSize: 14.0,
                //     ),
                //   ),
                // ),
                //
                // //! Enda Date
                // Text(
                //   "موعد التسليم",
                //   style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                // ),
                // ListTile(
                //   tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
                //   onTap: () async {
                //     await showDatePicker(
                //       context: context,
                //       firstDate: DateTime.now(),
                //       lastDate: DateTime(2050),
                //     ).then((value) async {
                //       log("${value?.day} ");
                //       if (value != null) if (!mounted) true;
                //       await showTimePicker(
                //         context: context,
                //         helpText: "اختر وقت البداية",
                //         initialTime: TimeOfDay.now(),
                //       ).then((value) async {
                //         if (!mounted) true;
                //         await showTimePicker(
                //           context: context,
                //           helpText: "اختر وقت النهاية",
                //           initialTime: TimeOfDay.now(),
                //         );
                //       });
                //     });
                //   },
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //     // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
                //   ),
                //   leading: Image.asset(ImageApp.calendar),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios_rounded,
                //     color: AppColor.darkGreyColor2,
                //   ),
                //   contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
                //   title: Text(
                //     "اختر التاريخ والوقت",
                //     style: getMediumStyle(
                //       color: AppColor.darkGreyColor2,
                //       fontSize: 14.0,
                //     ),
                //   ),
                // ),
                //
                // //! Option Order
                // Text(
                //   "خيارات الطلب",
                //   style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                // ),
                // // ListTile(
                // //   tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
                // //
                // //   shape: RoundedRectangleBorder(
                // //     borderRadius: BorderRadius.circular(10.0),
                // //     side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
                // //   ),
                // //   trailing: Icon(
                // //     Icons.arrow_forward_ios_rounded,
                // //     color: AppColor.darkGreyColor2,
                // //   ),
                // //   contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
                // //   title: Text(
                // //     "Tap",
                // //     style: getMediumStyle(
                // //       color: AppColor.darkGreyColor3,
                // //       fontSize: 14.0,
                // //     ),
                // //   ),
                // // ),
                // _dropDown(),
                // //! note
                // Text(
                //   "اضافة ملاحظات",
                //   style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                // ),
                // TextFieldWidget(
                //   validator: (val) {},
                //   controller: TextEditingController(),
                //   hintText: "اضافة ملاحظات",
                //   obscureText: false,
                //   onChange: (val) {},
                //   fillColor: AppColor.darkGreyColor2.withOpacity(0.1),
                //   minLine: 1,
                //   maxLine: 10,
                // ),
                //! Invoice
                Text(
                  "تفاصيل الفاتورة",
                  style: getBoldStyle(color: Colors.black, fontSize: 17.0),
                ),
               BlocBuilder<StoreCubit, StoreState>(
                 buildWhen: (previous, current) =>
                 current is CheckoutCartSuccess ||
                     current is CheckoutCartError,
                 builder: (context, state) {
                  if(state is CheckoutCartLoading){
                    return CircularProgressIndicator().center;
                  }else if(state is CheckoutCartError){
                    return Text(state.failure.message.toString()).center;
                  }else if(state is CheckoutCartSuccess){
                    return  _summery(state.message);
                  }else {
                    return SizedBox.shrink();
                  }
                 },
               ),
                ButtonWidgetWithText(
                  onPressed: () {},
                  txt: "متابعة لاتمام الطلب",
                  widthButton: MediaQuery.sizeOf(context).width * 0.7,
                  backgroundColor: AppColor.primaryColor,).center,
                10.ph,
              ],
            ),
          );
        }else if(state is GetCartError){
          return Text(state.failure.message.toString()).center;
        }else {
          return SizedBox.shrink();
        }
      })),
    );
  }

  //! list of product
  Widget _listOfProduct(CartModel cartModel){
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cartModel.data.cartItems.length,
        itemBuilder: (context, index) {
          var item = cartModel.data.cartItems[index];
          bool isSelected = selectedIndex == index;
          return SelectableContainer(
            selected: isSelected,
            onValueChanged: (newValue) {
              setState(() {
                if (newValue) {
                  // لما يختار العنصر
                  selectedIndex = index;
                  log(index.toString() + "5555555");
                } else {
                  // لما يلغي الاختيار (يضغط على الأيقونة)
                  context.read<StoreCubit>().deleteCartCubit(id: item.id);
                  selectedIndex = -1; // reset selection
                }
              });
            },
            icon: Icons.clear,
            selectedBorderColor: AppColor.redColor,
            unselectedBorderColor: Colors.transparent,
            elevation: 0.0,
            selectedBackgroundColor: Colors.transparent,
            unselectedBackgroundColor:Colors.transparent,
            padding: 0.0,
            selectedBackgroundColorIcon: AppColor.redColor,
            unselectedOpacity:1.0,
            topMargin: 0.0,
            borderRadius: 15.0,
            leftMargin: 0.0,
            rightMargin: 0.0,
            bottomMargin: 0.0,
            child: Card(
              elevation: 0.0,
              color: AppColor.darkGreyColor2.withOpacity(0.1),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        ImageApp.logo,
                        height: 50.0,
                        width: 50.0,
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "${item.product.price} ريال",
                            style: getMediumStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      trailing: Card(
                        elevation: 0.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 5.0,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.quantity++;
                                    context.read<StoreCubit>().updateCartCubit(id: item.id, quantity: item.quantity);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 15.0,
                                ),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: getBoldStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if(item.quantity == 1){

                                    }else {
                                      item.quantity--;
                                      context.read<StoreCubit>().updateCartCubit(id: item.id, quantity: item.quantity);
                                    }

                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 5.0),
                    //     child: Text(
                    //       "100 ريال",
                    //       style: getMediumStyle(
                    //         color: Colors.black,
                    //         fontSize: 14.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //! summery
  Widget _summery (CheckoutModel checkoutModel){
    return Card(
      elevation: 0.0,
      color: AppColor.darkGreyColor2.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _itemDetailsSummery(
              title:
              "تكلفة العناصر :",
              value: checkoutModel.data.basePrice.toString(),
            ),

            if(checkoutModel.data.checks.hasTax)...[
              Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
              _itemDetailsSummery(
                title:
                "ضريبة القيمة المصافة :",
                value: checkoutModel.data.taxAmount.toString(),
              ),
            ],
            if(checkoutModel.data.checks.hasShipping)...[
              Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
              _itemDetailsSummery(
                title:
                ( "رسوم التوصيل :"
                ),
                value: checkoutModel.data.shippingFees.toString(),
              ),
            ],
            if(checkoutModel.data.checks.hasDiscount)...[
              Divider(color: AppColor.darkGreyColor2.withOpacity(0.1)),
              _itemDetailsSummery(
                title:
                "تطبيق الخصم :"
                ,
                value: checkoutModel.data.discountAmount.toString(),
                valueColor: AppColor.redColor,
              ),
            ],

            Divider(
              color: AppColor.darkGreyColor3.withOpacity(0.2),
              thickness: 1.5,
            ),
            _itemDetailsSummery(
              title:
              "المبلغ الإجمالي",
              value: checkoutModel.data.finalTotal.toString(),
              // value: "0.0" ?? "",
              valueColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
  //! drop down
  Widget _dropDown (){
    return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          elevation: 0,
          hint:  Text("خيارات الطلب" , style: getMediumStyle(color: AppColor.darkGreyColor2),),
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
              borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 1.5), // ✅ Border عادي
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color: AppColor.darkGreyColor2.withOpacity(0.1), width: 2), // ✅ Border لما يتعمل Focus
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          ),
          // hint: const Text("اختر طريقة الدفع"),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
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

  Widget _applyCoupon(){
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if(state is ApplyCouponCartError){
          toastError(message: state.failure.message.toString());
        }
        if(state is ApplyCouponCartSuccess){
          context.read<StoreCubit>().getCartCubit(isLoad: true);
        }
      },
      builder: (context, state) {
       return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             child: TextFieldWidget(
               validator: (val) {},
               controller: _controller,
               minLine: 1,
               maxLine: 10,
               hintText: "ادخل كوبون الخصم",
               obscureText: false,
               onChange: (val) {},
               borderColor: AppColor.darkGreyColor2.withOpacity(0.1),
               fillColor: Colors.white,
             ),
           ),
           10.pw,
           (state is ApplyCouponCartLoading) ?
               CircularProgressIndicator()
               :
            ButtonWidgetWithText(
             onPressed: () {
               if(_controller.text.isNotEmpty)
               context.read<StoreCubit>().applyCouponCartCubit(coupon: _controller.text);
             },
             txt: "تطبيق",
             widthButton: 120,
             heightButton: 48,
             backgroundColor: AppColor.primaryColor,
             sizeText: 11.0,
           ),
         ],
       );
      },
    );
  }
  //! item invoice card
  Widget _itemDetailsSummery({
    required String title,
    required String value,
    Color? valueColor,
    String? total,
  }) {
    return Row(
      spacing: 5.0,
      children: [
        Text(
          title,
          style: getMediumStyle(color: AppColor.darkGreyColor3, fontSize: 14.0),
        ),
        Text(
          (total != null) ? "($total عنصر)" : "",
          style: getMediumStyle(color: AppColor.darkGreyColor3, fontSize: 11.0),
        ),
        Spacer(),
        Text(
          "$value${(Localizations.localeOf(context).toString() == "ar") ? " ﷼" : " SAR"}",
          style: getMediumStyle(
            color: valueColor ?? AppColor.darkGreyColor3,
            fontSize: (total != null) ? 16.0 : 14.0,
          ),
        ),
      ],
    );
  }

}
