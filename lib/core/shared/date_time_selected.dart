import 'dart:developer';
import 'package:clean_point/core/model/select_date_model.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../style/app_color.dart';
import '../style/app_font_style.dart';




class SelectDateAndTimeWidget extends StatefulWidget {
  final String title ;
  final String description ;
  final String buttonTitle ;
  final bool isReceive;
  const SelectDateAndTimeWidget({super.key, required this.title, required this.description, required this.buttonTitle, required this.isReceive});

  @override
  State<SelectDateAndTimeWidget> createState() => _SelectDateAndTimeWidgetState();
}

class _SelectDateAndTimeWidgetState extends State<SelectDateAndTimeWidget> {
  final start = DateTime.now();
  final dateTime = DateTime.now();
  final formatterDayName = DateFormat.EEEE('ar');
  final formatterCustom = DateFormat('d - M - y', 'ar');
  final formatterTime = DateFormat('hh : mm a', 'ar');

  TimeOfDay? selectedTime;
  final now = DateTime.now();

  // final formattedTime = DateFormat('hh : mm a', 'ar').format(DateTime.now());
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  int  ? selectItem;

  //! Start Time and Date
  String? startDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  String formattedTime(DateTime date) {
    // return DateFormat('hh : mm a', 'ar').format(date).toString().replaceAll('AM', 'صباحا')
    //     .replaceAll('PM', 'مساء'); // this very important
    // // return DateFormat('hh : mm a', 'ar').format(date).toString();

    final hour = (date.hour % 12 == 0 ? 12 : date.hour % 12)
        .toString()
        .padLeft(2, '0'); // ساعات 12h
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'مساء' : 'صباحا';

    return "$minute : $hour $period";
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )
      ),
      width: MediaQuery
          .sizeOf(context)
          .width / 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Text(
                  widget.title, style: getBoldStyle(color: Colors.black),),
                Text( widget.description,
                  style: getMediumStyle(color: AppColor.darkGreyColor3),),
                SizedBox(
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.13,
                  width: double.maxFinite,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final date = (widget.isReceive) ?  start.add(Duration(days: index)).add(const Duration(days: 1))
                          : start.add(Duration(days: index));
                      final isToday = _isSameDay(date, DateTime.now());
                      String? formattedTime;
                      if (selectedTime != null) {
                        final dt = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          selectedTime!.hour,
                          selectedTime!.minute,
                        );
                        // startDate = "${date.day} / ${date.month} / ${date.year}";
                        // log(startDate.toString());
                        formattedTime = formatterTime.format(dt);
                      }
                      return
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectItem = index;
                              startDate = "${date.day} / ${date.month} / ${date.year}";
                              dateTime == date;
                              log(startDate.toString());
                            });


                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (selectItem == index) ? AppColor
                                  .primaryLightColor : Color(0xffF8FCFE),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    formatterDayName.format(date),
                                    style: getMediumStyle(
                                      color: (selectItem == index)
                                          ? Colors.white
                                          : AppColor.primaryLightColor,),
                                  ),
                                  Text(formatterCustom.format(date),
                                    style: getMediumStyle(
                                      color: (selectItem == index)
                                          ? Colors.white
                                          : AppColor.primaryLightColor,),
                                  ),
                                ]),
                          ),
                        )
                      ;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    if(startDate == null){
                      toastWarning(message: "قم باختيار التاريخ اولا");
                    }else {
                      await showTimePicker(
                        context: context,
                        helpText: "اختر وقت البداية",
                        initialTime: TimeOfDay.now(),
                      ).then((value)async {
                        // setState(() {
                        //   startTime = "${value.hour} : ${value.minute}";
                        // });
                        setState(() {
                          startTime = value;
                          // startTime = "${value!.hour} : ${value!.minute}";
                        });
                        if (!mounted) true;
                        await showTimePicker(
                          context: context,
                          helpText: "اختر وقت النهاية",
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          setState(() {
                            endTime = value;
                            // endTime = "${value!.hour} : ${value!.minute}";
                          });
                          print(value.toString());
                        },);
                      },);
                    }

                  },
                  child: Card(
                    elevation: 0.0,
                    color: AppColor.lightBlueColor.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              (startTime!= null && endTime!= null) ?
                                  "${formattedTime(DateTime(
                                      dateTime.year,
                                      dateTime.month,
                                      dateTime.day,
                                    startTime!.hour,
                                    startTime!.minute
                                  ))} - ${formattedTime(DateTime(
                                      dateTime.year,
                                      dateTime.month,
                                      dateTime.day,
                                      endTime!.hour,
                                      endTime!.minute
                                  ))}"
                                  :
                              "اختر وقت البداية و النهاية" ,style: getMediumStyle(color: Colors.black, fontSize: 16.0),),
                    ),
                  ),
                ).center,
              ],
            ),
          ),
          SafeArea(
              child: GestureDetector(
                onTap: () {
                  if (startDate != null && startTime != null && endTime != null) {
                    Navigator.pop(
                      context,
                      SelectedDataModel(
                        date: startDate!,
                        startTime: startTime!,
                        endTime: endTime!,
                      ),
                    );

                  }
                },
                child: Container(
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.07,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )
                  ),
                  child: Text(widget.buttonTitle,
                    style: getBoldStyle(color: Colors.white),),
                ),
              ))
        ],
      ),
    );

  }
}
