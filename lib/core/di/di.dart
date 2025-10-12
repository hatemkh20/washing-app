import 'package:get_it/get_it.dart' show GetIt;

import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  //! Authentication

  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(authDataSource: getIt()),);
  getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepository: getIt()));

  //! Home

}

