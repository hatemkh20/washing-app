import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../menu_list/view/menu_list_screen.dart';
import '../requets/view/request_screen.dart';
import '../store/view/store_screen.dart' show StoreScreen;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  int currentIndex = 0;
  
  List<Widget> screens = [
    HomeScreen(),
    RequestsScreen(),
    StoreScreen(),
    Text("الشات").center,
    MenuListScreen(),
  ];
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
              Navigator.pushNamed(context, Routes.editProfile);
            },
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              // backgroundImage: AssetImage(""),
              radius: 25.0,
              child: Icon(Icons.person,color: Colors.white,),
            ),
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 2.0,
          children: [
            Text("اهلا ومرحبا بك 🎉" ,style: getMediumStyle(color: AppColor.darkGreyColor3),),
            Text("يامن محمد" ,style: getBoldStyle(color: Colors.black).copyWith(fontSize: 18.0),),
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
                side: BorderSide(
                  color: AppColor.darkGreyColor2,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notification);
                },
                icon: Icon(Icons.notifications_active_sharp, color:Colors.black),
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
                side: BorderSide(
                  color: AppColor.darkGreyColor2,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: Image.asset(ImageApp.store, color:Colors.black),
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
            selectedLabelStyle: getBoldStyle(color: AppColor.primaryColor).copyWith(fontSize: 14.0),
            unselectedLabelStyle: getSemiBoldStyle(color: AppColor.darkGreyColor3).copyWith(fontSize: 15.0),
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
              BottomNavigationBarItem(icon: Image.asset(ImageApp.home, color: (currentIndex == 0) ? AppColor.primaryColor : AppColor.darkGreyColor3,),
                  label: "الرئيسية"),
              BottomNavigationBarItem(icon: Image.asset(ImageApp.requests, color: (currentIndex == 1) ? AppColor.primaryColor : AppColor.darkGreyColor3,),
                  label: "طلبات"),
              BottomNavigationBarItem(icon: Image.asset(ImageApp.store, color: (currentIndex == 2) ? AppColor.primaryColor : AppColor.darkGreyColor3,),
                  label: "المتجر"),
              BottomNavigationBarItem(icon: Image.asset(ImageApp.chat, color: (currentIndex == 3) ? AppColor.primaryColor : AppColor.darkGreyColor3,),
                  label: "الشات"),
              BottomNavigationBarItem(icon: Image.asset(ImageApp.menu, color: (currentIndex == 4) ? AppColor.primaryColor : AppColor.darkGreyColor3,),
                  label: "القائمة"),
        ]),
      ),
    );
  }
}
