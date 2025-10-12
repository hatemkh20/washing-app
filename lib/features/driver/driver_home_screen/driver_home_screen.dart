import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../driver_request/view/driver_accepted_screen.dart';
import '../driver_request/view/driver_process_screen.dart';
import '../driver_request/view/driver_rejected_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Tab(text: "قيد التنفيذ"),
    const Tab(text: "مقبولة"),
    const Tab(text: "مرفوضة"),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  bool statues = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.0,
        children: [
          10.ph,
          //! statues
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("اختار حالتك", style: getBoldStyle(color: Colors.black)),
              RotatedBox(
                quarterTurns: 90,
                child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: AppColor.primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: statues,
                  onChanged: (value) {
                    setState(() {
                      statues = !statues;
                    });
                  },
                ),
              ),
            ],
          ),
          //! Requests
          Container(
            // height: 70,
            width: MediaQuery.sizeOf(context).width * 0.7,
            padding: EdgeInsets.zero,
            child: TabBar(
              controller: _tabController,
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10.0),
              //   color: AppColor.primaryColor,
              // ),
              indicatorAnimation: TabIndicatorAnimation.elastic,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding:  EdgeInsets.zero,
              indicatorColor: AppColor.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              labelColor: AppColor.primaryColor,
              unselectedLabelColor: AppColor.darkGreyColor2,
              labelPadding: EdgeInsets.zero,
              labelStyle:
              getBoldStyle(color: Colors.black).copyWith(fontSize: 16.0),
              unselectedLabelStyle:
              getBoldStyle(color: Colors.black).copyWith(fontSize: 14.0),
              tabs: _tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DriverProcessScreen(),
                DriverAcceptedScreen(),
                DriverRejectedScreen(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
