

import 'package:dio/dio.dart';

import '../networking/dio_factory.dart';
import 'exceptions.dart';

dynamic handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw const FetchDataException();
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.unauthorized:
          throw const UnauthorizedException();
        case StatusCode.forbidden:
          throw const ForbiddenException();
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.conflict:
          throw const ConflictException();
        case StatusCode.internetServerError:
          throw const InternalServerErrorException();
      }
      break;
    case DioExceptionType.cancel:
      throw const CancelRequestException();
    case DioExceptionType.unknown:
      throw const UnknownException();
    case DioExceptionType.badCertificate:
      throw const BadCertificateException();
    case DioExceptionType.connectionError:
      throw const NoInternetConnectionException();
  }
}
