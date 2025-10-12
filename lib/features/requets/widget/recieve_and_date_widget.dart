import 'package:clean_point/features/address/address_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/model/select_date_model.dart';
import '../../../core/shared/date_time_selected.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';
import '../../../core/utils/image_app.dart';

class ReceiveAndDateWidget extends StatefulWidget {
  const ReceiveAndDateWidget({super.key});

  @override
  State<ReceiveAndDateWidget> createState() => _ReceiveAndDateWidgetState();
}

class _ReceiveAndDateWidgetState extends State<ReceiveAndDateWidget> {

  //! Date of receipt
  String  ? dateReceipt;
  String  ? startTimeReceipt;
  String ? endTimeReceipt;

  //! Delivery date
   String  ? dateDelivery;
  String  ? startTimeDelivery;
  String ? endTimeDelivery;
  String formattedTime(DateTime date) {
    final hour = (date.hour % 12 == 0 ? 12 : date.hour % 12)
        .toString()
        .padLeft(2, '0'); // ساعات 12h
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'مساء' : 'صباحا';

    return "$minute : $hour $period";
  }
  Future<void> _openBottomSheet1(BuildContext context) async {
    final result = await showModalBottomSheet<SelectedDataModel>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SelectDateAndTimeWidget(
        title: "موعد الاستلام",
        description: "يرجي تحديد اليوم والوقت المناسب للاستلام",
        buttonTitle: "تأكيد موعد الاستلام",
        isReceive: false,
      ),
    ).then((value) {
      if (value != null) {
       final dateTime = DateTime.now();
        print("التاريخ: ${value.date}");
        print("البداية: ${formattedTime(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            value.startTime.hour,
            value.startTime.minute
        ))}");
        print("النهاية: ${formattedTime(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            value.endTime.hour,
            value.endTime.minute
        ))}");

        setState(() {
          dateReceipt = value.date;
          startTimeReceipt = formattedTime(DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day,
              value.startTime.hour,
              value.startTime.minute
          ));
          endTimeReceipt = formattedTime(DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day,
              value.endTime.hour,
              value.endTime.minute
          ));
        });
      }
      // Navigator.pop(context, SelectedDataModel.empty());
      SelectedDataModel.empty();
    },);


  }

  Future<void> _openBottomSheet2(BuildContext context) async {
    final result = await showModalBottomSheet<SelectedDataModel>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SelectDateAndTimeWidget(
        title: "موعد التسليم",
        description: "يرجي تحديد وقت التوصيل",
        buttonTitle: "تأكيد وقت التوصيل",
        isReceive: true,
      ),
    ).then((value) {
      if (value != null) {
        final dateTime = DateTime.now();
        print("التاريخ: ${value.date}");
        print("البداية: ${formattedTime(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            value.startTime.hour,
            value.startTime.minute
        ))}");
        print("النهاية: ${formattedTime(DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            value.endTime.hour,
            value.endTime.minute
        ))}");
        setState(() {
          dateDelivery = value.date;
          startTimeDelivery = formattedTime(DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day,
              value.startTime.hour,
              value.startTime.minute
          ));
          endTimeDelivery = formattedTime(DateTime(
              dateTime.year,
              dateTime.month,
              dateTime.day,
              value.endTime.hour,
              value.endTime.minute
          ));
        });
      }
      // Navigator.pop(context, SelectedDataModel.empty());
      SelectedDataModel.empty();
    },);


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10.0,
      children: [
        //! address
        Text("عنوان الاستلام", style: getBoldStyle(color: Colors.black),),
        ListTile(
          tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen(),));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
          ),
          leading: Image.asset(ImageApp.location2,   color: AppColor.darkGreyColor2,),

          contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
          title: Text(
            "اختر موقع الاستلام",
            style: getMediumStyle(
              color: AppColor.darkGreyColor2,
              fontSize: 14.0,
            ),
          ),
        ),
        //! start
        Text("موعد الاستلام", style: getBoldStyle(color: Colors.black),),
        ListTile(
          tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
          onTap: () => _openBottomSheet1(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
          ),
          leading: Image.asset(ImageApp.calendar),

          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.darkGreyColor2,
          ),
          contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
          title: Text(
            (dateReceipt != null && startTimeReceipt != null && endTimeReceipt != null) ?
                "$dateReceipt \n$startTimeReceipt - $endTimeReceipt"
                :
            "اختر التاريخ والوقت",
            style: getMediumStyle(
              color:(dateReceipt != null && startTimeReceipt != null && endTimeReceipt != null) ?
              AppColor.darkGreyColor3 : AppColor.darkGreyColor2,
              fontSize: 14.0,
            ),
          ),
        ),
        //! end
        Text("موعد التسليم", style: getBoldStyle(color: Colors.black),),
        ListTile(
          tileColor: AppColor.darkGreyColor2.withOpacity(0.1),
          onTap: () => _openBottomSheet2(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: BorderSide(color: AppColor.darkGreyColor2, width: 0.7),
          ),
          leading: Image.asset(ImageApp.calendar),

          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.darkGreyColor2,
          ),
          contentPadding: EdgeInsets.only(right: 15.0, left: 8.0),
          title: Text(
            (dateDelivery != null && startTimeDelivery != null && endTimeDelivery != null) ?
            "$dateDelivery \n$startTimeDelivery - $endTimeDelivery"
                :
            "اختر التاريخ والوقت",
            style: getMediumStyle(
              color:(dateDelivery != null && startTimeDelivery != null && endTimeDelivery != null) ?
              AppColor.darkGreyColor3 : AppColor.darkGreyColor2,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
