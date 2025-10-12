import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/shared/app_bar_widget.dart';
import '../../../core/shared/button_widget_with_text.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, kToolbarHeight),
        child: AppBarWidget(title: ""),
      ),
      body:
          Column(
            spacing: 20.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageApp.rate),
              Text(
                "تقييم عام للخدمة",
                style: getBoldStyle(color: Colors.black),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                unratedColor: Colors.amber.withOpacity(0.2),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder:
                    (context, _) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text("تقييم للمندوب", style: getBoldStyle(color: Colors.black)),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                unratedColor: Colors.amber.withOpacity(0.2),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder:
                    (context, _) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              ButtonWidgetWithText(
                onPressed: () {},
                txt: "ارسال",
                widthButton: MediaQuery.sizeOf(context).width * 0.8,
                backgroundColor: AppColor.primaryColor,
              ),

            ],
          ).center,
    );
  }
}
