import 'dart:io';

import 'package:clean_point/features/auth/data/model/user_date_request.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/handel_error.dart';
import '../../../../core/networking/api_end_point.dart';
import '../../../../core/networking/dio_factory.dart';

class AuthDataSource {
  //! LOGIN
  Future<Response> loginDataSource({
    required String phone,
    required String password,
    String? type,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.login,
        data: {"phone": phone, "password": password},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! REGISTER
  Future<Response> registerDataSource({required UserDataRequest user}) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.register,
        data: user.toJson(),
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> checkUserDataSource({
    required String phone,
    required String email,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.checkUser,
        data: {"phone": phone, "email": email},
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
        ApiEndPoint.checkUser,
        data: {"phone": phone},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! VERIFY ACCOUNT
  Future<Response> verifyCodeDataSource({
    required String phone,
    // required String code,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.verifyCode,
        data: {
          "phone": phone,
          // "otp": code,
        },
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
          // "type": "user",
          "new_password": password,
          // "password_confirmation": passwordConfirmation,
        },
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> changePasswordDataSource({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.resetPassword,
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
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
      Response response = await DioFactory.dio!.post(ApiEndPoint.logout);
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
        data: {"fcm_token": fcmToken},
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! Get Profile
  Future<Response> getProfileDataSource() async {
    try {
      Response response = await DioFactory.dio!.get(
        ApiEndPoint.getAndUpdateProfile,
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  //! Update Profile
  Future<Response> updateProfileDataSource({
    required String name,
    required String email,
    required String phone,
    File? avatar,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        if (avatar != null)
          "avatar": await MultipartFile.fromFile(
            avatar.path,
            filename: avatar.path.split('/').last.toString(),
          ),
        "name": name,
        "email": email,
        "phone": phone,
      });
      Response response = await DioFactory.dio!.post(
        ApiEndPoint.getAndUpdateProfile,
        data: formData,
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> contactUsDataSource({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      Response response = await DioFactory.dio!.post(
        "/contact-us",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "message": message,
        },
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }
}
