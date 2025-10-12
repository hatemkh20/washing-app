part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


//! Login
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final dynamic loginModel;
  LoginSuccess({required this.loginModel});
}
final class LoginError extends AuthState {
  final Failure failure;
  LoginError({required this.failure});
}

//! Register
final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}
final class RegisterError extends AuthState {
  final Failure failure;
  RegisterError({required this.failure});
}

//! Forget password
final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordSuccess extends AuthState {
  final String message;
  ForgetPasswordSuccess({required this.message});
}
final class ForgetPasswordError extends AuthState {
  final Failure failure;
  ForgetPasswordError({required this.failure});
}

//! Verify account
final class VerifyCodeLoading extends AuthState {}
final class VerifyCodeSuccess extends AuthState {
  final String message;
  VerifyCodeSuccess({required this.message});
}
final class VerifyCodeError extends AuthState {
  final Failure failure;
  VerifyCodeError({required this.failure});
}
final class VerifyCodePasswordLoading extends AuthState {}
final class VerifyCodePasswordSuccess extends AuthState {
  final String message;
  VerifyCodePasswordSuccess({required this.message});
}
final class VerifyCodePasswordError extends AuthState {
  final Failure failure;
  VerifyCodePasswordError({required this.failure});
}


//! Resend code
final class ResendCodeLoading extends AuthState {}
final class ResendCodeSuccess extends AuthState {
  final String message;
  ResendCodeSuccess({required this.message});
}
final class ResendCodeError extends AuthState {
  final Failure failure;
  ResendCodeError({required this.failure});
}

//! Reset Password
final class ResetPasswordLoading extends AuthState {}
final class ResetPasswordSuccess extends AuthState {
  final String message;
  ResetPasswordSuccess({required this.message});
}
final class ResetPasswordError extends AuthState {
  final Failure failure;
  ResetPasswordError({required this.failure});
}

//! Logout
final class LogoutLoading extends AuthState {}
final class LogoutSuccess extends AuthState {
  final String message;
  LogoutSuccess({required this.message});
}
final class LogoutError extends AuthState {
  final Failure failure;
  LogoutError({required this.failure});
}
