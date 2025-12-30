
import 'dart:developer';

import 'package:clean_point/core/local/flutter_secure_manager.dart';
import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/global_function.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/core/utils/toast.dart';
import 'package:clean_point/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/di.dart';
import '../../core/local/shared_prefs_manager.dart';
import '../home/cubit/home_cubit.dart';
import '../home/data/repository/home_repository.dart';
import '../home/view/home_screen.dart';
import '../menu_list/view/menu_list_screen.dart';
import '../requets/view/request_screen.dart';
import '../store/cubit/store_cubit.dart';
import '../store/data/repository/store_repository.dart';
import '../store/view/store_screen.dart' show StoreScreen;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create:
                (context) =>
            HomeCubit(homeRepository: getIt<HomeRepository>())..homeCubit(),),
          BlocProvider<StoreCubit>(
            create:
                (context) => StoreCubit(storeRepository: getIt<StoreRepository>()),),

        ],child: HomeScreen()),
    RequestsScreen(),
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => StoreCubit(storeRepository: getIt<StoreRepository>())..getStoreCubit(),)
        ],child: StoreScreen()),
    Text("الشات").center,
    MenuListScreen(),
  ];

  String? imageUrl;
  String? skip;

  void getStateSkip()async{
    final  stateSkip = await SharedPrefsManager.getData(key: "skip");
    skip = stateSkip;

    log(stateSkip.toString());
    if(skip == null){
      context.read<AuthCubit>()..getProfileCubit();
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getStateSkip();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, Routes.editProfile);
              globalCheckSkippingMode(Routes.editProfile);
            },
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              backgroundImage:
                  (imageUrl != null && imageUrl != "")
                      ? NetworkImage(imageUrl!)
                      : null,
              radius: 25.0,
              child:
                  (imageUrl != null && imageUrl != "")
                      ? null
                      : Icon(Icons.person, color: Colors.white),
            ),
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 2.0,
          children: [
            Text(
              "اهلا ومرحبا بك 🎉",
              style: getMediumStyle(color: AppColor.darkGreyColor3),
            ),
            if(skip == null)
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is GetProfileSuccess) {
                  imageUrl = state.profileModel.data.profile.image;
                }
                if (state is GetProfileError) {
                  toastError(message: state.failure.message.toString());
                }
              },
              builder: (context, state) {
                if (state is GetProfileLoading) {
                  return Text(
                    "جاري تحميل البيانات....",
                    style: getBoldStyle(
                      color: Colors.black,
                    ).copyWith(fontSize: 18.0),
                  );
                }
                if (state is GetProfileSuccess) {
                  return Text(
                    state.profileModel.data.profile.name.toString(),
                    style: getBoldStyle(
                      color: Colors.black,
                    ).copyWith(fontSize: 18.0),
                  );
                }
                return SizedBox.shrink();
              },
            ) else Text(
      "الدخول كزائر",
      style: getBoldStyle(
        color: Colors.black,
      ).copyWith(fontSize: 18.0),
    ) ,
          ],
        ),
        actions: [
          //! Notification
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.darkGreyColor2, width: 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
                icon: Icon(
                  Icons.notifications_active_sharp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          //! Cart
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.darkGreyColor2, width: 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: Image.asset(ImageApp.store, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(6.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedLabelStyle: getBoldStyle(
            color: AppColor.primaryColor,
          ).copyWith(fontSize: 14.0),
          unselectedLabelStyle: getSemiBoldStyle(
            color: AppColor.darkGreyColor3,
          ).copyWith(fontSize: 15.0),
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.darkGreyColor3,
          currentIndex: currentIndex,
          // iconSize: 20.0,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageApp.home,
                color:
                    (currentIndex == 0)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageApp.requests,
                color:
                    (currentIndex == 1)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "طلبات",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageApp.store,
                color:
                    (currentIndex == 2)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "المتجر",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageApp.chat,
                color:
                    (currentIndex == 3)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "الشات",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                ImageApp.menu,
                color:
                    (currentIndex == 4)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "القائمة",
            ),
          ],
        ),
      ),
    );
  }
}
