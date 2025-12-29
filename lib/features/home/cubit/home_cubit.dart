import 'package:bloc/bloc.dart';
import 'package:clean_point/core/error/failure.dart';
import 'package:clean_point/features/home/data/model/home_model.dart';
import 'package:clean_point/features/home/data/repository/home_repository.dart';
import 'package:meta/meta.dart';

import '../data/model/package_details_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  void homeCubit({bool isLoad = true})async{
    if(isLoad){
      emit(HomeLoading());
    }

    var homeCubit = await homeRepository.homeRepo();

    homeCubit.fold((failure) {
      emit(HomeError(failure: failure));

    }, (r) {
      emit(HomeSuccess(homeModel: r));
    },);
  }

  void packageDetailsCubit({required int id})async{
    emit(PackageDetailsLoading());
    var detailsPackages = await homeRepository.detailsPackagesRepo(id: id);

    detailsPackages.fold((failure) {
      emit(PackageDetailsError(failure: failure));

    }, (r) {
      emit(PackageDetailsSuccess(packageDetailsModel: r));
    },);
  }
}
