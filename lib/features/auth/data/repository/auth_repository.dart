import 'dart:io';

import 'package:clean_point/features/auth/data/model/check_user_model.dart';
import 'package:clean_point/features/auth/data/model/profile_model.dart';
import 'package:clean_point/features/auth/data/model/sign_up_response_model.dart';
import 'package:clean_point/features/auth/data/model/user_date_request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_source/auth_data_source.dart';

class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  //! login repository
  Future<Either<Failure, SignUpResponseModel>> loginRepo({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await authDataSource.loginDataSource(
        password: password,
        phone: phone,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = SignUpResponseModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! register repository
  Future<Either<Failure, SignUpResponseModel>> repositoryRepo({
    required UserDataRequest user,
  }) async {
    try {
      final response = await authDataSource.registerDataSource(user: user);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = SignUpResponseModel.fromJson(response.data);
        return Right(data);
        // return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  Future<Either<Failure, CheckUserModel>> checkUserRepo({
    required String phone,
    required String email,
  }) async {
    try {
      final response = await authDataSource.checkUserDataSource(
        phone: phone,
        email: email,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = CheckUserModel.fromJson(response.data);
        return Right(data);
        // return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! forget repository
  Future<Either<Failure, CheckUserModel>> forgetPasswordRepo({
    required String phone,
  }) async {
    try {
      final response = await authDataSource.forgetPasswordDataSource(
        phone: phone,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = CheckUserModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! verify code
  Future<Either<Failure, String>> verifyCodeRepo({
    required String phone,
    // required String code,
  }) async {
    try {
      final response = await authDataSource.verifyCodeDataSource(
        phone: phone,
        // code: code,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  Future<Either<Failure, String>> verifyCodePasswordRepo({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await authDataSource.verifyCodePasswordDataSource(
        phone: phone,
        code: code,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! resend
  Future<Either<Failure, String>> resendCodeRepo({
    required String phone,
  }) async {
    try {
      final response = await authDataSource.resendCodeDataSource(phone: phone);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! reset password
  Future<Either<Failure, String>> resetPasswordRepo({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await authDataSource.resetPasswordDataSource(
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  Future<Either<Failure, String>> updatePasswordRepo({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await authDataSource.changePasswordDataSource(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! logout
  Future<Either<Failure, String>> logoutRepo() async {
    try {
      final response = await authDataSource.logoutDataSource();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  Future<Either<Failure, String>> fcmTokenRepo({
    required String fcmToken,
  }) async {
    try {
      final response = await authDataSource.fcmDataSource(fcmToken: fcmToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(AuthFailure(message: response.data['message']));
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

  //! get and update profile
  Future<Either<Failure, ProfileModel>> getProfileRepo() async {
    try {
      final response = await authDataSource.getProfileDataSource();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = ProfileModel.fromJson(response.data);
        return Right(data);
      } else if (response.statusCode == 401) {
        return Left(ProfileFailure(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        return Left(
          ProfileFailure(
            message: response.data['message'],
            data: response.data['errors'],
          ),
        );
      }
      return Left(ProfileFailure(message: response.data['message']));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  //! update profile
  Future<Either<Failure, String>> updateProfileRepo({
    required String name,
    required String email,
    required String phone,
    File? avatar,
  }) async {
    try {
      final response = await authDataSource.updateProfileDataSource(
        name: name,
        email: email,
        phone: phone,
        avatar: avatar,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(ProfileFailure(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        return Left(
          ProfileFailure(
            message: response.data['message'],
            data: response.data['data'],
          ),
        );
      }
      return Left(ProfileFailure(message: response.data['message']));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> contactUsRepo({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      final response = await authDataSource.contactUsDataSource(
        name: name,
        email: email,
        phone: phone,
        message: message,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['message']);
      } else if (response.statusCode == 401) {
        return Left(ProfileFailure(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        return Left(
          ProfileFailure(
            message: response.data['message'],
            data: response.data['data'],
          ),
        );
      }
      return Left(ProfileFailure(message: response.data['message']));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
