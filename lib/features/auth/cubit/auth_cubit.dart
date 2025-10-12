import 'package:bloc/bloc.dart';
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
    required String type,
  }) async {
    emit(LoginLoading());
    var login = await authRepository.loginRepo(
      phone: phone,
      password: password,
      type: type,
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
  Future<void> registerCubit({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String password,
    required String passwordConfirmation,
    required int agreedOnTermsAt,
  }) async {
    emit(RegisterLoading());
    var register = await authRepository.repositoryRepo(
      name: name,
      email: email,
      phone: phone,
      address: address,
      password: password,
      passwordConfirmation: passwordConfirmation,
      agreedOnTermsAt: agreedOnTermsAt,
    );

    register.fold(
          (failure) {
        emit(RegisterError(failure: failure));
      },
          (success) {
        emit(RegisterSuccess(message: success));
      },
    );
  }


  //! forget
  Future<void> forgetPasswordCubit({required String phone}) async {
    emit(ForgetPasswordLoading());
    var register = await authRepository.forgetPasswordRepo(phone: phone);

    register.fold(
          (failure) {
        emit(ForgetPasswordError(failure: failure));
      },
          (success) {
        emit(ForgetPasswordSuccess(message: success));
      },
    );
  }

  //! verify account
  Future<void> verifyCodeCubit({
    required String phone,
    required String code,
  }) async {
    emit(VerifyCodeLoading());
    var verifyCode = await authRepository.verifyCodeRepo(
      phone: phone,
      code: code,
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
}
