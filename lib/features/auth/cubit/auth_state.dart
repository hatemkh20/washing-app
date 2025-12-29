part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//! Login
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final SignUpResponseModel loginModel;
  LoginSuccess({required this.loginModel});
}

final class LoginError extends AuthState {
  final Failure failure;
  LoginError({required this.failure});
}

//! Register
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final SignUpResponseModel message;
  RegisterSuccess({required this.message});
}

final class RegisterError extends AuthState {
  final Failure failure;
  RegisterError({required this.failure});
}

final class CheckUserLoading extends AuthState {}

final class CheckUserSuccess extends AuthState {
  final CheckUserModel message;
  CheckUserSuccess({required this.message});
}

final class CheckUserError extends AuthState {
  final Failure failure;
  CheckUserError({required this.failure});
}

//! Forget password
final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordSuccess extends AuthState {
  final CheckUserModel message;
  ForgetPasswordSuccess({required this.message});
}

final class ForgetPasswordError extends AuthState {
  final Failure failure;
  ForgetPasswordError({required this.failure});
}

//! Verify account
final class VerifyCodeLoading extends AuthState {}

final class VerifyCodeLoading2 extends AuthState {}

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

//! Get Profile
final class GetProfileLoading extends AuthState {}

final class GetProfileSuccess extends AuthState {
  final ProfileModel profileModel;
  GetProfileSuccess({required this.profileModel});
}

final class GetProfileError extends AuthState {
  final Failure failure;
  GetProfileError({required this.failure});
}

//! Update Profile
final class UpdateProfileLoading extends AuthState {}

final class UpdateProfileSuccess extends AuthState {
  final String message;

  UpdateProfileSuccess({required this.message});
}

final class UpdateProfileError extends AuthState {
  final Failure failure;

  UpdateProfileError({required this.failure});
}

final class ContactUsLoading extends AuthState {}

final class ContactUsSuccess extends AuthState {
  final String message;

  ContactUsSuccess({required this.message});
}

final class ContactUsError extends AuthState {
  final Failure failure;

  ContactUsError({required this.failure});
}