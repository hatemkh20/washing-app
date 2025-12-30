import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_point/features/store/data/model/cart_model.dart';
import 'package:clean_point/features/store/data/model/checkout_model.dart';
import 'package:clean_point/features/store/data/repository/store_repository.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../data/model/store_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository storeRepository;
  StoreCubit({required this.storeRepository}) : super(StoreInitial());

  void getStoreCubit()async{
    emit(GetStoreLoading());
    var homeCubit = await storeRepository.getFavRepo();

    homeCubit.fold((failure) {
      emit(GetStoreError(failure: failure));

    }, (r) {
      emit(GetStoreSuccess(storeModel: r));
    },);
  }

  Future<void> addStoreCubit({required int id})async{
    emit(AddStoreLoading());
    var homeCubit = await storeRepository.addFavRepo(id: id);

    homeCubit.fold((failure) {
      emit(AddStoreError(failure: failure));

    }, (r) {
      getStoreCubit();
      emit(AddStoreSuccess(message: r));
    },);
  }

  Future<void> addCartCubit({required int id , required int quantity})async{
    emit(AddCartLoading());
    var homeCubit = await storeRepository.addCartRepo(id: id, quantity: quantity);

    homeCubit.fold((failure) {
      emit(AddCartError(failure: failure));

    }, (r) {
      emit(AddCartSuccess(message: r));
    },);
  }

  Future<void> deleteCartCubit({required int id })async{
    emit(DeleteCartLoading());
    var homeCubit = await storeRepository.deleteCartRepo(id: id);

    homeCubit.fold((failure) {
      emit(DeleteCartError(failure: failure));

    }, (r) {
      getCartCubit();
      emit(DeleteCartSuccess(message: r));
    },);
  }

  void getCartCubit({bool isLoad = false})async{
    if(isLoad) return;
    emit(GetCartLoading());
    var homeCubit = await storeRepository.getCartRepo();

    homeCubit.fold((failure) {
      emit(GetCartError(failure: failure));

    }, (r) {
      emit(GetCartSuccess(cartModel: r));
    },);
  }

  Future<void> updateCartCubit({required int id , required int quantity})async{
    emit(UpdateCartLoading());
    var homeCubit = await storeRepository.updateCartRepo(id: id, quantity: quantity);

    homeCubit.fold((failure) {
      emit(UpdateCartError(failure: failure));

    }, (r) {
      emit(UpdateCartSuccess(message: r));
    },);
  }

  void checkoutCartCubit({String? coupon})async{
    emit(CheckoutCartLoading());
    var homeCubit = await storeRepository.checkoutCartRepo(coupon: coupon);

    homeCubit.fold((failure) {
      emit(CheckoutCartError(failure: failure));

    }, (r) {
      emit(CheckoutCartSuccess(message: r));
    },);
  }

  Future<void> applyCouponCartCubit({String? coupon})async{
    emit(ApplyCouponCartLoading());
    var homeCubit = await storeRepository.applyCouponCartRepo(coupon: coupon);

    homeCubit.fold((failure) {
      emit(ApplyCouponCartError(failure: failure));

    }, (r) {
      log("message");
      checkoutCartCubit(coupon: coupon);
      emit(ApplyCouponCartSuccess(message: r));
    },);
  }
}
