import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/home/data/model/home_model.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';

class ServiceHomeWidget extends StatefulWidget {
  final HomeModel homeModel;
  const ServiceHomeWidget({super.key, required this.homeModel});

  @override
  State<ServiceHomeWidget> createState() => _ServiceHomeWidgetState();
}

class _ServiceHomeWidgetState extends State<ServiceHomeWidget> {
  int indexItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryLightColor.withOpacity(0.2),
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الخدمات", style: getBoldStyle(color: Colors.black)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addRequests);
                },
                child: Text(
                  "اضف طلب",
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            child:
                (widget.homeModel.data.home.services.isEmpty)
                    ? Icon(
                      Icons.cyclone_sharp,
                      color: AppColor.primaryColor,
                      size: 70.0,
                    ).center
                    : ListView.builder(
                      itemCount: widget.homeModel.data.home.services.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                indexItem = index;
                              });
                            },
                            child: Card(
                              elevation: 0.0,
                              color:
                                  (indexItem == index)
                                      ? AppColor.primaryColor
                                      : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                  color:
                                      (indexItem == index)
                                          ? AppColor.primaryColor
                                          : AppColor.darkGreyColor3.withOpacity(
                                            0.2,
                                          ),
                                ),
                              ),
                              margin: EdgeInsets.all(5.0),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child:
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      spacing: 10.0,
                                      children: [
                                        SizedBox(
                                          // height: 80.0,
                                          // width: 80.0,
                                          //   child: Image.asset(ImageApp.logo,scale: 0.7,
                                          //     color: (indexItem == index) ? Colors.white : AppColor.primaryLightColor,)
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                widget
                                                    .homeModel
                                                    .data
                                                    .home
                                                    .services[index]
                                                    .image,
                                            progressIndicatorBuilder:
                                                (
                                                  context,
                                                  url,
                                                  downloadProgress,
                                                ) => CircularProgressIndicator(
                                                  value:
                                                      downloadProgress.progress,
                                                  color: Colors.white,
                                                ),
                                            errorWidget:
                                                (context, url, error) => Icon(
                                                  Icons.error,
                                                  color: Colors.white,
                                                  size: 50.0,
                                                ),
                                          ),
                                        ).center,

                                        Text(
                                          widget
                                              .homeModel
                                              .data
                                              .home
                                              .services[index]
                                              .name,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: getBoldStyle(
                                            color:
                                                (indexItem == index)
                                                    ? Colors.white
                                                    : AppColor
                                                        .primaryLightColor,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ).center,
                              ),
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
