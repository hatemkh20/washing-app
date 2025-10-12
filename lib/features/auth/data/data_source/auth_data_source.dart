import 'package:dio/dio.dart';

import '../../../../core/error/handel_error.dart';
import '../../../../core/networking/api_end_point.dart';
import '../../../../core/networking/dio_factory.dart';

class AuthDataSource {
  //! LOGIN
  Future<Response> loginDataSource({
    required String phone,
    required String password,
    required String type,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.login,
        data: {"phone": phone, "password": password, "type": type,},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! REGISTER
  Future<Response> registerDataSource({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
    required String passwordConfirmation,
    required int agreedOnTermsAt,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.register,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "address": address,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "agreed_on_terms_at" : agreedOnTermsAt,
        },
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! FORGET
  Future<Response> forgetPasswordDataSource({required String phone}) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.forgotPassword,
        data: {"phone": phone, "type": "user"},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! VERIFY ACCOUNT
  Future<Response> verifyCodeDataSource({
    required String phone,
    required String code,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.verifyCode,
        data: {"phone": phone, "code": code},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! verify password
    Future<Response> verifyCodePasswordDataSource({
      required String phone,
      required String code,
    }) async {
      try {
        Response response = await DioFactory.dio!.post(
          ApiEndPoint.verifyCodePassword,
          data: {"phone": phone, "code": code},
        );
        return response;
      } on DioException catch (error) {
        return handleDioError(error);
      }
    }

  //! RESEND CODE
  Future<Response> resendCodeDataSource({required String phone}) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.resendCode,
        data: {"phone": phone},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //reset password
  Future<Response> resetPasswordDataSource({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.resetPassword,
        data: {
          "phone": phone,
          "type": "user",
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! LOGOUT
  Future<Response> logoutDataSource() async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.logout,
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! FCM
  Future<Response> fcmDataSource({required String fcmToken}) async {
    try {
      Response response = await DioFactory.dio!.put(
          "/auth/fcm-token",
          data :{
            "fcm_token" : fcmToken,
          }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }
}
