import 'package:clean_point/core/di/di.dart';
import 'package:clean_point/core/shared/button_widget_with_icon.dart';
import 'package:clean_point/core/style/app_color.dart';
import 'package:clean_point/core/style/app_font_style.dart';
import 'package:clean_point/core/utils/extensions.dart';
import 'package:clean_point/core/utils/image_app.dart';
import 'package:clean_point/features/store/cubit/store_cubit.dart';
import 'package:clean_point/features/store/data/repository/store_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with RouteAware {

  @override
  void initState() {
    super.initState();
    context.read<StoreCubit>().getStoreCubit();
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
      context.read<StoreCubit>().getStoreCubit();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit , StoreState>(
          buildWhen: (previous, current) =>
          current is GetStoreSuccess ||
      current is GetStoreError,
          builder: (context, state) {
          if(state is GetStoreLoading){
    return CircularProgressIndicator().center;
          }else if(state is GetStoreSuccess){
    if(state.storeModel.data.favorites.isEmpty){
      return Icon(Icons.favorite , size: 100,color: AppColor.redColor,).center;
    }
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // mainAxisSpacing: 10.0,
        //   crossAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      padding: EdgeInsets.all(10.0),
      itemCount: state.storeModel.data.favorites.length,
      itemBuilder: (context, index) {
        var item = state.storeModel.data.favorites[index];
        return Card(
          elevation: 0.0,
          color: Colors.white,
          margin: EdgeInsets.all(5.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
            Stack(
              alignment: Alignment.topLeft,
              children: [
                // 10.ph,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.0,
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: Image.network(item.image),
                    ).center,

                    Text(item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getSemiBoldStyle(color: Colors.black, fontSize: 14.0),),
                    Text(" ${item.price}ريال", style: getSemiBoldStyle(color: AppColor.darkGreyColor3, fontSize: 14.0),),
                    ButtonWidgetWithIcon(
                      onPressed: () {
                    setState(() {
                      item.inCart = !(item.inCart!);
                      // if(item.inCart == true){
                        context.read<StoreCubit>().addCartCubit(id: item.id, quantity: 1);
                      // }else {
                      //   context.read<StoreCubit>().deleteCartCubit(id: item.id);
                      // }
                    });
                      },
                      txt: (item.inCart == true) ? "تمت الاضافه للسلة" : 'اضافه الي السلة',
                      color: (item.inCart == true) ? AppColor.redColor : AppColor.primaryColor,
                      iconDataWidget: Image.asset(ImageApp.addCart, color: Colors.white,),
                      txtSize: 10.0,
                      heightButton: 35.0,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: ()async {
                     await context.read<StoreCubit>().addStoreCubit(id: item.id);
                    },
                  child: Image.asset(ImageApp.favourite2, color: Colors.red,),
                )
              ],
            ).center,

          ),
        );
      },);
          }else if(state is GetStoreError){
    return Text(state.failure.message.toString()).center;
          }else {
    return SizedBox.shrink();
          }
        },);
  }
}
