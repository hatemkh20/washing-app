import 'dart:developer';
import 'package:clean_point/core/di/di.dart';
import 'package:clean_point/core/routing/routes.dart';
import 'package:clean_point/features/auth/cubit/auth_cubit.dart';
import 'package:clean_point/features/auth/data/model/user_date_request.dart';
import 'package:clean_point/features/auth/data/repository/auth_repository.dart';
import 'package:clean_point/features/auth/view/change_password_screen.dart';
import 'package:clean_point/features/auth/view/forget_password_screen.dart';
import 'package:clean_point/features/auth/view/login_screen.dart';
import 'package:clean_point/features/auth/view/signup_screen.dart';
import 'package:clean_point/features/auth/view/update_password_screen.dart';
import 'package:clean_point/features/auth/view/verify_password_code_screen.dart';
import 'package:clean_point/features/home/cubit/home_cubit.dart';
import 'package:clean_point/features/home/data/repository/home_repository.dart';
import 'package:clean_point/features/intro/onboarding_screen.dart';
import 'package:clean_point/features/main_screen/main_screen.dart';
import 'package:clean_point/features/menu_list/view/contact_us_screen.dart';
import 'package:clean_point/features/menu_list/view/edit_profile_screen.dart';
import 'package:clean_point/features/notificaion/view/notification_screen.dart';
import 'package:clean_point/features/package_subscribtion/details_package_screen.dart';
import 'package:clean_point/features/requets/view/add_requests_screen.dart';
import 'package:clean_point/features/payment/view/payment_screen.dart';
import 'package:clean_point/features/payment/view/select_payment_type_screen.dart';
import 'package:clean_point/features/requets/view/details_request_screen.dart';
import 'package:clean_point/features/requets/view/request_screen.dart';
import 'package:clean_point/features/requets/view/track_request_screen.dart';
import 'package:clean_point/features/wallet/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/view/verify_account_code_screen.dart';
import '../../features/cart/view/cart_screen.dart';
import '../../features/menu_list/view/donation_services_screen.dart';
import '../../features/menu_list/view/privacy_policy_screen.dart';
import '../../features/menu_list/view/terms_and_confition_screen.dart';
import '../../features/intro/splash.dart';
import '../style/app_font_style.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    log('Route requested : "${settings.name}"');
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
          settings: settings,
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
          settings: settings,
        );
      //! Auth Module
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: LoginScreen(),
              ),
          settings: settings,
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: SignUpScreen(),
              ),
          settings: settings,
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: ForgetPasswordScreen(),
              ),
          settings: settings,
        );
      case Routes.otpPasswordCodeScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        String phone = args["phone"] as String;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: VerifyPasswordCodeScreen(phone: phone),
              ),
          settings: settings,
        );
      case Routes.otpAccountCodeScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        String phone = args["phone"] as String;
        UserDataRequest? userDataRequest = args["user"] as UserDataRequest?;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: VerifyAccountCodeScreen(
                  phone: phone,
                  user: userDataRequest,
                ),
              ),
          settings: settings,
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: ChangePasswordScreen(),
              ),
          settings: settings,
        );
      case Routes.updatePassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: UpdatePasswordScreen(),
              ),
          settings: settings,
        );
      //! Home
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: MainScreen(),
              ),
          settings: settings,
        );
      case Routes.contactUs:
        return MaterialPageRoute(
          builder: (context) => ContactUsScreen(),
          settings: settings,
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => PrivacyPolicyScreen(),
          settings: settings,
        );
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) => TermsAndConditionsScreen(),
          settings: settings,
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        AuthCubit(authRepository: getIt<AuthRepository>()),
                child: EditProfileScreen(),
              ),
          settings: settings,
        );
      case Routes.walletScreen:
        return MaterialPageRoute(
          builder: (context) => WalletScreen(),
          settings: settings,
        );
      case Routes.notification:
        return MaterialPageRoute(
          builder: (context) => NotificationScreen(),
          settings: settings,
        );
      case Routes.donationServiceScreen:
        return MaterialPageRoute(
          builder: (context) => DonationServicesScreen(),
          settings: settings,
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
          settings: settings,
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (context) => PaymentScreen(),
          settings: settings,
        );
      case Routes.selectPaymentTypeScreen:
        return MaterialPageRoute(
          builder: (context) => SelectPaymentTypeScreen(),
          settings: settings,
        );
      case Routes.requests:
        return MaterialPageRoute(
          builder: (context) => RequestsScreen(),
          settings: settings,
        );
      case Routes.addRequests:
        return MaterialPageRoute(
          builder: (context) => AddRequestsScreen(),
          settings: settings,
        );
      case Routes.detailsRequest:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        int index = args["id"] as int;
        return MaterialPageRoute(
          builder: (context) => DetailsRequestScreen(index: index),
          settings: settings,
        );
      case Routes.trackRequest:
        return MaterialPageRoute(
          builder: (context) => TrackRequestScreen(),
          settings: settings,
        );
      case Routes.detailsPackage:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        int id = args["id"] as int;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider<HomeCubit>(
                create:
                    (context) =>
                        HomeCubit(homeRepository: getIt<HomeRepository>())
                          ..packageDetailsCubit(id: id),
                child: DetailsPackageScreen(),
              ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                    style: getMediumStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
              ),
        );
    }
  }
}
