part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class GetStoreLoading extends StoreState {}
final class GetStoreSuccess extends StoreState {
  final StoreModel storeModel;
  GetStoreSuccess({required this.storeModel});
}
final class GetStoreError extends StoreState {
  final Failure failure;
  GetStoreError({required this.failure});
}

//! add od delete

final class AddStoreLoading extends StoreState {}
final class AddStoreSuccess extends StoreState {
  final dynamic message;
  AddStoreSuccess({required this.message});
}
final class AddStoreError extends StoreState {
  final Failure failure;
  AddStoreError({required this.failure});
}

// ! add cart
final class AddCartLoading extends StoreState {}
final class AddCartSuccess extends StoreState {
  final dynamic message;
  AddCartSuccess({required this.message});
}
final class AddCartError extends StoreState {
  final Failure failure;
  AddCartError({required this.failure});
}

final class DeleteCartLoading extends StoreState {}
final class DeleteCartSuccess extends StoreState {
  final dynamic message;
  DeleteCartSuccess({required this.message});
}
final class DeleteCartError extends StoreState {
  final Failure failure;
  DeleteCartError({required this.failure});
}


final class GetCartLoading extends StoreState {}
final class GetCartSuccess extends StoreState {
  final CartModel cartModel;
  GetCartSuccess({required this.cartModel});
}
final class GetCartError extends StoreState {
  final Failure failure;
  GetCartError({required this.failure});
}


final class UpdateCartLoading extends StoreState {}
final class UpdateCartSuccess extends StoreState {
  final dynamic message;
  UpdateCartSuccess({required this.message});
}
final class UpdateCartError extends StoreState {
  final Failure failure;
  UpdateCartError({required this.failure});
}

final class CheckoutCartLoading extends StoreState {}
final class CheckoutCartSuccess extends StoreState {
  final CheckoutModel message;
  CheckoutCartSuccess({required this.message});
}
final class CheckoutCartError extends StoreState {
  final Failure failure;
  CheckoutCartError({required this.failure});
}

final class ApplyCouponCartLoading extends StoreState {}
final class ApplyCouponCartSuccess extends StoreState {
  final dynamic message;
  ApplyCouponCartSuccess({required this.message});
}
final class ApplyCouponCartError extends StoreState {
  final Failure failure;
  ApplyCouponCartError({required this.failure});
}