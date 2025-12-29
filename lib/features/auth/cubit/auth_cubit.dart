import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_point/features/auth/data/model/check_user_model.dart';
import 'package:clean_point/features/auth/data/model/login_response_model.dart';
import 'package:clean_point/features/auth/data/model/profile_model.dart';
import 'package:clean_point/features/auth/data/model/sign_up_response_model.dart';
import 'package:clean_point/features/auth/data/model/user_date_request.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failure.dart';
import '../data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  //! login
  Future<void> loginCubit({
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());
    var login = await authRepository.loginRepo(
      phone: phone,
      password: password,
    );

    login.fold(
      (failure) {
        emit(LoginError(failure: failure));
      },
      (success) {
        emit(LoginSuccess(loginModel: success));
      },
    );
  }

  //! register
  Future<void> registerCubit({required UserDataRequest user}) async {
    emit(RegisterLoading());
    var register = await authRepository.repositoryRepo(user: user);

    register.fold(
      (failure) {
        emit(RegisterError(failure: failure));
      },
      (success) {
        emit(RegisterSuccess(message: success));
      },
    );
  }

  Future<void> checkUserCubit({
    required String phone,
    required String email,
  }) async {
    emit(CheckUserLoading());
    var register = await authRepository.checkUserRepo(
      phone: phone,
      email: email,
    );

    register.fold(
      (failure) {
        emit(CheckUserError(failure: failure));
      },
      (success) {
        emit(CheckUserSuccess(message: success));
      },
    );
  }

  //! forget
  Future<void> forgetPasswordCubit({required String phone}) async {
    emit(ForgetPasswordLoading());
    var register = await authRepository.forgetPasswordRepo(phone: phone);

    register.fold(
      (failure) {
        log(failure.message.toString());
        emit(ForgetPasswordError(failure: failure));
      },
      (success) {
        log(success.message.toString());
        emit(ForgetPasswordSuccess(message: success));
      },
    );
  }

  //! verify account
  Future<void> verifyCodeCubit({
    required String phone,
    // required String code,
    bool isLoading2 = false,
  }) async {
    if (isLoading2) {
      emit(VerifyCodeLoading2());
    } else {
      emit(VerifyCodeLoading());
    }
    var verifyCode = await authRepository.verifyCodeRepo(
      phone: phone,
      // code: code,
    );

    verifyCode.fold(
      (failure) {
        emit(VerifyCodeError(failure: failure));
      },
      (success) {
        emit(VerifyCodeSuccess(message: success));
      },
    );
  }

  Future<void> verifyCodePasswordCubit({
    required String phone,
    required String code,
  }) async {
    emit(VerifyCodePasswordLoading());
    var verifyCode = await authRepository.verifyCodePasswordRepo(
      phone: phone,
      code: code,
    );

    verifyCode.fold(
      (failure) {
        emit(VerifyCodePasswordError(failure: failure));
      },
      (success) {
        emit(VerifyCodePasswordSuccess(message: success));
      },
    );
  }

  //! resend code
  Future<void> resendCodeCubit({required String phone}) async {
    emit(ResendCodeLoading());
    var register = await authRepository.resendCodeRepo(phone: phone);

    register.fold(
      (failure) {
        emit(ResendCodeError(failure: failure));
      },
      (success) {
        emit(ResendCodeSuccess(message: success));
      },
    );
  }

  //! reset password
  Future<void> resetPasswordCubit({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(ResetPasswordLoading());
    var reset = await authRepository.resetPasswordRepo(
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    reset.fold(
      (failure) {
        emit(ResetPasswordError(failure: failure));
      },
      (success) {
        emit(ResetPasswordSuccess(message: success));
      },
    );
  }

  Future<void> updatePasswordCubit({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    var reset = await authRepository.updatePasswordRepo(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    reset.fold(
      (failure) {
        emit(ResetPasswordError(failure: failure));
      },
      (success) {
        emit(ResetPasswordSuccess(message: success));
      },
    );
  }

  //! Logout
  Future<void> logoutCubit() async {
    emit(LogoutLoading());
    var register = await authRepository.logoutRepo();

    register.fold(
      (failure) {
        emit(LogoutError(failure: failure));
      },
      (success) {
        emit(LogoutSuccess(message: success));
      },
    );
  }

  //! Get Profile
  Future<void> getProfileCubit() async {
    emit(GetProfileLoading());
    var getProfile = await authRepository.getProfileRepo();

    getProfile.fold(
      (failure) {
        emit(GetProfileError(failure: failure));
      },
      (success) {
        log(success.data.toString());
        emit(GetProfileSuccess(profileModel: success));
      },
    );
  }

  //! Update Profile
  Future<void> updateProfileCubit({
    required String name,
    required String email,
    required String phone,
    File? avatar,
  }) async {
    emit(UpdateProfileLoading());
    var updateProfile = await authRepository.updateProfileRepo(
      name: name,
      email: email,
      phone: phone,
      avatar: avatar,
    );

    updateProfile.fold(
      (failure) {
        log(failure.message.toString());
        emit(UpdateProfileError(failure: failure));
      },
      (success) {
        // getProfileCubit();
        emit(UpdateProfileSuccess(message: success));
      },
    );
  }

  Future<void> contactUsCubit({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    emit(ContactUsLoading());
    var updateProfile = await authRepository.contactUsRepo(
      name: name,
      email: email,
      phone: phone,
      message: message,
    );

    updateProfile.fold(
          (failure) {
        log(failure.message.toString());
        emit(ContactUsError(failure: failure));
      },
          (success) {
        // getProfileCubit();
        emit(ContactUsSuccess(message: success));
      },
    );
  }
}
