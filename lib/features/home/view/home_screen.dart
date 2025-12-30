import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_point/core/di/di.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/features/home/cubit/home_cubit.dart';
import 'package:clean_point/features/home/data/repository/home_repository.dart';
import 'package:clean_point/features/home/widget/package_subscribtion_widget.dart';
import 'package:clean_point/features/home/widget/product_home_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_point/features/home/widget/service_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/style/app_color.dart';
import '../../../main.dart';
import '../../store/cubit/store_cubit.dart';
import '../../store/data/repository/store_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>    with RouteAware {

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().homeCubit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  bool isLoading = true;
  @override
  void didPopNext() {
    setState(() {
      // BlocProvider<HomeCubit>(
      //   create:
      //       (context) =>
      //   HomeCubit(homeRepository: getIt<HomeRepository>())..homeCubit(),);
      context.read<HomeCubit>().homeCubit(isLoad: false);
    });
  }
  CarouselSliderController control = CarouselSliderController();
  PageController pageController = PageController();
  int? indexSlider;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return CircularProgressIndicator().center;
        }

        if (state is HomeError) {
          return Text(
            state.failure.message.toString(),
            style: getMediumStyle(color: Colors.red),
          ).center;
        }
        if (state is HomeSuccess) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //! Carusel slider and indicator
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.22,
                  width: double.infinity,
                  // alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  margin: const EdgeInsets.all(20.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColor.primaryColor,
                    border: Border.all(color: Colors.transparent, width: 0.0),
                  ),
                  child: CarouselSlider(
                    carouselController: control,
                    items: List.generate(state.homeModel.data.home.sliders.length, (
                      index,
                    ) {
                      return Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:
                        // Image.asset(
                        //   ImageApp.logo,
                        //   color: Colors.white,
                        //   width: double.infinity,
                        //   isAntiAlias: true,
                        //   fit: BoxFit.cover,
                        //   errorBuilder: (context, error, stackTrace) {
                        //     return Container(
                        //       color: Colors.grey[300], // لون بديل للصورة
                        //       child: Center(
                        //         child: Icon(
                        //           Icons
                        //               .image_not_supported, // أيقونة صورة مفقودة
                        //           color: Colors.grey[600],
                        //           size: 50,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   // loadingBuilder: (BuildContext context, Widget child,
                        //   //     ImageChunkEvent? loadingProgress) {
                        //   //   if (loadingProgress == null) return child;
                        //   //   return Center(
                        //   //     child: CircularProgressIndicator(
                        //   //       color: AppColor.primaryColor,
                        //   //       value: loadingProgress.expectedTotalBytes != null
                        //   //           ? loadingProgress.cumulativeBytesLoaded /
                        //   //           loadingProgress.expectedTotalBytes!
                        //   //           : null,
                        //   //     ),
                        //   //   );
                        //   // },
                        // ),
                        CachedNetworkImage(
                          imageUrl:
                              state.homeModel.data.home.sliders[index].image
                                  .toString(),
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: Colors.white,
                                  ),
                          errorWidget:
                              (context, url, error) => Icon(
                                Icons.error,
                                color: Colors.white,
                                size: 50.0,
                              ),
                        ),
                      );
                    }),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.22,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      animateToClosest: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      pageSnapping: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.linear,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                      scrollPhysics: const BouncingScrollPhysics(),
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        setState(() {
                          indexSlider = index;
                        });
                      },
                    ),
                  ),
                ),
                10.ph,
                SizedBox(
                  height: 15.0,
                  width: double.maxFinite,
                  child:
                      Row(
                        // scrollDirection: Axis.horizontal,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          state.homeModel.data.home.sliders.length,
                          (index) => Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  (indexSlider == index)
                                      ? AppColor.primaryColor
                                      : AppColor.primaryLightColor,
                            ),
                          ),
                        ),
                      ).center,
                ),
                10.ph,
                //! Home Service
                ServiceHomeWidget(homeModel: state.homeModel),
                //! product home
                ProductHomeWidget(homeModel: state.homeModel),
                //! subscribtion
                PackageSubscribtionWidget(homeModel: state.homeModel),
              ],
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
