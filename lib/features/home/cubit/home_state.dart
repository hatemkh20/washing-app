part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final HomeModel homeModel;
  HomeSuccess({required this.homeModel});
}
final class HomeError extends HomeState {
  final Failure failure;
  HomeError({required this.failure});
}


//-----------

final class PackageDetailsLoading extends HomeState {}
final class PackageDetailsSuccess extends HomeState {
  final PackageDetailsModel packageDetailsModel;
  PackageDetailsSuccess({required this.packageDetailsModel});
}
final class PackageDetailsError extends HomeState {
  final Failure failure;
  PackageDetailsError({required this.failure});
}
