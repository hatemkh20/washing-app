import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/app_font_style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String checkLang = Localizations.localeOf(context).toString();
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Card(
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
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color:AppColor.darkGreyColor3),
          ),
        ),
        title: Text(
          (checkLang == "ar") ? "سياسة الخصوصية" : "ٌReturn Policy",
          style: getBoldStyle(color: AppColor.darkGreyColor3, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height / 1,
        padding: EdgeInsets.all(20.0),
        width: double.maxFinite,
        alignment: Alignment.topCenter,
        child :
        // BlocBuilder<MoreCubit, MoreState>(
        //   builder: (context, state) {
        //     if(state is GetMoreInfoAppLoading){
        //       return CircularProgressIndicator(color: AppColor.primaryColor,).center;
        //     }else if(state is GetMoreInfoAppSuccess){
        //       return
                HtmlWidget(
                  // state.settingModel.data.privacyPolicy.toString()
                  "<h1>Privacy Policy</h1>"
              ),
        //     }else if(state is GetMoreInfoAppError) {
        //       return Text(state.failure.message.toString() , style:  getBoldStyle(color: Colors.red),).center;
        //     }else {
        //       return Container();
        //     }
        //   },
        // ),
      ),
    );
  }
}
