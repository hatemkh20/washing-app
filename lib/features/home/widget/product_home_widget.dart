import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/home/cubit/home_cubit.dart';
import 'package:clean_point/features/home/data/model/home_model.dart';
import 'package:clean_point/features/store/cubit/store_cubit.dart';
import 'package:clean_point/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/local/flutter_secure_manager.dart';
import '../../../core/local/shared_prefs_manager.dart';
import '../../../core/shared/button_widget_with_icon.dart';
import '../../../core/shared/skip_dialog.dart';
import '../../../core/utils/image_app.dart';

class ProductHomeWidget extends StatefulWidget {
  final HomeModel homeModel;
  const ProductHomeWidget({super.key, required this.homeModel});

  @override
  State<ProductHomeWidget> createState() => _ProductHomeWidgetState();
}

class _ProductHomeWidgetState extends State<ProductHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("منتجات للغسيل", style: getBoldStyle(color: Colors.black)),
              TextButton(
                onPressed: () {},
                child: Text(
                  "عرض الكل",
                  style: getSemiBoldStyle(
                    color: AppColor.darkGreyColor3,
                  ).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child:
                (widget.homeModel.data.home.products.isEmpty)
                    ? Icon(
                      Icons.cyclone_sharp,
                      color: AppColor.primaryColor,
                      size: 70.0,
                    ).center
                    : ListView.builder(
                      itemCount: widget.homeModel.data.home.products.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Card(
                            elevation: 0.0,
                            color: Colors.white,
                            margin: EdgeInsets.all(5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child:
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 10.0,
                                        children: [
                                          // 10.ph,
                                          SizedBox(
                                            // height: 80.0,
                                            // width: 80.0,
                                            child:
                                            // Image.asset(ImageApp.logo,scale: 0.7,)
                                            CachedNetworkImage(
                                              imageUrl:
                                                  widget
                                                      .homeModel
                                                      .data
                                                      .home
                                                      .products[index]
                                                      .image
                                                      .toString(),
                                              height: 100,
                                              width: 100,
                                              progressIndicatorBuilder:
                                                  (
                                                    context,
                                                    url,
                                                    downloadProgress,
                                                  ) =>
                                                      CircularProgressIndicator(
                                                        value:
                                                            downloadProgress
                                                                .progress,
                                                        color: Colors.white,
                                                      ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                    Icons.error,
                                                    color:
                                                        AppColor.primaryColor,
                                                    size: 50.0,
                                                  ),
                                            ),
                                          ).center,
                                          Text(
                                            widget
                                                .homeModel
                                                .data
                                                .home
                                                .products[index]
                                                .name
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: getSemiBoldStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Text(
                                            "${widget.homeModel.data.home.products[index].price} ريال",
                                            style: getSemiBoldStyle(
                                              color: AppColor.darkGreyColor3,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          ButtonWidgetWithIcon(
                                            onPressed: () async{
                                              final  checkSkip = await SharedPrefsManager.getData(key: "skip");
                                              log(checkSkip.toString());
                                              if(checkSkip != null){
                                                showDialogSkip(globalNavigatorKey.currentState!.context);
                                              }else {
                                                setState(() {
                                                  widget.homeModel.data.home.products[index].isCart =
                                                  !(widget.homeModel.data.home.products[index].isCart!);

                                                  // if(widget.homeModel.data.home.products[index].isCart == true){
                                                  //   context.read<StoreCubit>().deleteCartCubit(id: widget.homeModel.data.home.products[index].id);
                                                  // }else {
                                                    context.read<StoreCubit>().addCartCubit(id: widget.homeModel.data.home.products[index].id, quantity: 1);
                                                  // }
                                                });
                                              }
                                             ;
                                            },
                                            txt:(widget.homeModel.data.home.products[index].isCart == true)
                                                ? "تمت الاضافه للسلة" : 'اضافه الي السلة',
                                            color:(widget.homeModel.data.home.products[index].isCart == true)
                                                ? AppColor.redColor : AppColor.primaryColor,
                                            iconDataWidget: Image.asset(
                                             ImageApp.addCart,
                                              color: Colors.white,
                                            ),
                                            txtSize:( widget.homeModel.data.home.products[index].isCart == true) ? 9.0 : 10.0,
                                            heightButton: 35.0,
                                          ),
                                        ],
                                      ),
                                      // BlocListener<StoreCubit, StoreState>(
                                      //   listener: (context, state) {
                                      //     if (state is AddCartSuccess || state is DeleteCartSuccess) {
                                      //       setState(() {
                                      //         // widget.homeModel.data.home.products[index].isCart =
                                      //         // !(widget.homeModel.data.home.products[index].isCart ?? false);
                                      //         // !
                                      //         context.read<HomeCubit>().homeCubit();
                                      //       });
                                      //     } else if (state is AddCartError || state is DeleteCartError) {
                                      //       // لو فشل، اعرض رسالة خطأ
                                      //       ScaffoldMessenger.of(context).showSnackBar(
                                      //         SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')),
                                      //       );
                                      //     }
                                      //   },
                                      //   child: SizedBox.shrink(),
                                      // ),

                                      IgnorePointer(
                                        ignoring: false,
                                        child: GestureDetector(
                                          onTap: ()async {
                                            final  checkSkip = await SharedPrefsManager.getData(key: "skip");
                                            log(checkSkip.toString());
                                            if(checkSkip != null){
                                              showDialogSkip(globalNavigatorKey.currentState!.context);
                                            }else {
                                              setState(() {
                                                widget
                                                    .homeModel
                                                    .data
                                                    .home
                                                    .products
                                                    .where(
                                                      (element) =>
                                                  element.id ==
                                                      widget
                                                          .homeModel
                                                          .data
                                                          .home
                                                          .products[index]
                                                          .id,
                                                )
                                                    .first
                                                    .isFavorite = (!widget
                                                    .homeModel
                                                    .data
                                                    .home
                                                    .products[index]
                                                    .isFavorite!);
                                              });
                                              context.read<StoreCubit>().addStoreCubit(id: widget
                                                  .homeModel
                                                  .data
                                                  .home
                                                  .products[index]
                                                  .id);
                                            }
                                          },
                                          child: Image.asset(
                                            (widget
                                                        .homeModel
                                                        .data
                                                        .home
                                                        .products[index]
                                                        .isFavorite ==
                                                    true)
                                                ? ImageApp.favourite2
                                                : ImageApp.favourite1,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).center,
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
