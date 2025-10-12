import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_source/auth_data_source.dart';


class AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  //! login repository
  Future<Either<Failure, dynamic>> loginRepo({
    required String phone,
    required String password,
    required String type,
  }) async {
    try {
      final response = await authDataSource.loginDataSource(
        password: password,
        phone: phone,
        type: type,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // var data = LoginModel.fromJson(response.data);
        return Right(response.data);
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

  //! register repository
  Future<Either<Failure, String>> repositoryRepo({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
    required String passwordConfirmation,
    required int agreedOnTermsAt,
  }) async {
    try {
      final response = await authDataSource.registerDataSource(
        name: name,
        email: email,
        phone: phone,
        address: address,
        password: password,
        passwordConfirmation: passwordConfirmation,
        agreedOnTermsAt: agreedOnTermsAt,
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


  //! forget repository
  Future<Either<Failure, String>> forgetPasswordRepo({
    required String phone,
  }) async {
    try {
      final response = await authDataSource.forgetPasswordDataSource(
        phone: phone,
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

  //! verify code
  Future<Either<Failure, String>> verifyCodeRepo({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await authDataSource.verifyCodeDataSource(
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
      final response = await authDataSource.resendCodeDataSource(
        phone: phone,
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

  Future<Either<Failure, String>> fcmTokenRepo({required String fcmToken}) async {
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
}