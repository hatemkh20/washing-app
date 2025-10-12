import 'package:clean_point/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/local/flutter_secure_manager.dart';
import 'core/local/shared_prefs_manager.dart';
import 'core/networking/dio_factory.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/utils/observer.dart';
import 'l10n/app_localizations.dart';



final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

final GlobalKey<NavigatorState> globalNavigatorKey =
GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver =
RouteObserver<ModalRoute<void>>();



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    setupGetIt(),
    SharedPrefsManager.init(),
    FlutterSecureManager.init(),
  ]);
  DioFactory.initialDio();
  Bloc.observer = MyBlocObserver();
  //! For StatuesBar
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.light,
  //       statusBarBrightness: Brightness.dark,
  //     statusBarColor: AppColor.primaryColor,
  //   ),
  // );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Point',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("ar"),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryLightColor),
        scaffoldBackgroundColor: Color(0xfff9f9f9),
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: globalNavigatorKey,
      navigatorObservers: [routeObserver],
    );
  }
}
