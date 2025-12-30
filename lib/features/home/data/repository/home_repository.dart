import 'package:clean_point/features/home/data/data_source/home_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/home_model.dart';
import '../model/package_details_model.dart';

class HomeRepository{
  final HomeDataSource homeDataSource;
  HomeRepository({required this.homeDataSource});

  Future<Either<Failure, HomeModel>> homeRepo() async {
    try {
      final response = await homeDataSource.homeDataSource();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = HomeModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(
          message: response.data['message'],
        ));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        return Left(
          AuthFailure(
            message: response.data['message'],
            data: response.data['data'],
          ),
        );
      }
      return Left(AuthFailure(message: response.data['message']));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }


  Future<Either<Failure, PackageDetailsModel>> detailsPackagesRepo({required int id}) async {
    try {
      final response = await homeDataSource.detailsPackagesDataSource(id: id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = PackageDetailsModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(
          message: response.data['message'],
        ));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        return Left(
          AuthFailure(
            message: response.data['message'],
            data: response.data['data'],
          ),
        );
      }
      return Left(AuthFailure(message: response.data['message']));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}