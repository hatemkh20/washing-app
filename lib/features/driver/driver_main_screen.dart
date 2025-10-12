import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/routing/routes.dart';
import '../../core/style/app_color.dart';
import '../../core/style/app_font_style.dart';
import '../../core/utils/image_app.dart';
import 'driver_home_screen/driver_home_screen.dart';

class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [DriverHomeScreen(), Text("الشات").center];

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
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              // backgroundImage: AssetImage(""),
              radius: 25.0,
              child: Icon(Icons.person, color: Colors.white),
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
            Text(
              "يامن محمد",
              style: getBoldStyle(color: Colors.black).copyWith(fontSize: 18.0),
            ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Card(
              elevation: 0.0,
              color: AppColor.primaryLightColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primaryLightColor, width: 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
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
                ImageApp.chat,
                color:
                    (currentIndex == 1)
                        ? AppColor.primaryColor
                        : AppColor.darkGreyColor3,
              ),
              label: "الشات",
            ),
          ],
        ),
      ),
    );
  }
}
