import 'package:dio/dio.dart';

import '../../../../core/error/handel_error.dart';
import '../../../../core/networking/api_end_point.dart';
import '../../../../core/networking/dio_factory.dart';

class HomeDataSource{
  Future<Response> homeDataSource() async {
    try {
      Response response = await DioFactory.dio!.get(
        ApiEndPoint.getHome,

      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> detailsPackagesDataSource({required int id}) async {
    try {
      Response response = await DioFactory.dio!.get(
        ApiEndPoint.detailsPackages(id),

      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }
}