import 'package:clean_point/features/home/data/data_source/home_data_source.dart';
import 'package:clean_point/features/home/data/repository/home_repository.dart';
import 'package:clean_point/features/store/cubit/store_cubit.dart';
import 'package:clean_point/features/store/data/data_source/store_data_source.dart';
import 'package:clean_point/features/store/data/repository/store_repository.dart';
import 'package:get_it/get_it.dart' show GetIt;

import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  //! Authentication

  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(authDataSource: getIt()),);
  getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepository: getIt()));

  //! Home
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(homeDataSource: getIt()),);
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: getIt()));

  //! Store
  getIt.registerLazySingleton<StoreDataSource>(() => StoreDataSource());
  getIt.registerLazySingleton<StoreRepository>(() => StoreRepository(storeDataSource: getIt()),);
  getIt.registerFactory<StoreCubit>(() => StoreCubit(storeRepository: getIt()));
}

