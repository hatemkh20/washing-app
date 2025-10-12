import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../main.dart';
import '../local/flutter_secure_manager.dart';
import '../routing/routes.dart';
import '../utils/toast.dart';
import 'api_end_point.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static initialDio() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    // Duration timeOut = const Duration(seconds: 60);
    dio!.interceptors.add(ApiClassInterceptor());
    addDioInterceptor();
    return dio;
  }

  static void addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        error: true,
      ),
    );
  }
}

class ApiClassInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = await FlutterSecureManager.readData(key: "token");
    // String checkLang = Localizations.localeOf(globalNavigatorKey.currentState!.context).toString();

    //* Option track your request -------*
    Duration timeOut = const Duration(seconds: 60);
    options
      ..connectTimeout = timeOut
      ..receiveTimeout = timeOut
      ..responseType = ResponseType.json
      ..followRedirects = false
      // ..validateStatus = (status) {
      //   return status! < StatusCode.internetServerError;
      // }
      // ..validateStatus = (status) {
      //   if (status == null) return false;
      //   return status >= 200 && status < 300;
      // }
      ..validateStatus = (status) {
        if (status == null) return false;
        return (status >= 200 && status < 300) || status == 400 || status == 422 || status == 404;
        // return status >= 200 && status < 300;
        // return (status >= 200 && status < 300) || status == 400 || status == 401 || status == 422 || status == 404;
       }
      ..headers = {
        "Content-Type": "application/json",
        if (token != null && token.isNotEmpty)
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        // "Accept-Language" : (checkLang.toString() == "ar") ? "ar" : "en",
      };
      // if (token != null && token.isNotEmpty) {
      //   options.headers["Authorization"] = "Bearer $token";
      // }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await FlutterSecureManager.deleteData(key: "token");
      await FlutterSecureManager.deleteData(key: "skip");

      globalNavigatorKey.currentState?.pushReplacementNamed(Routes.loginScreen);

      toastSuccess(
        message:
        // (Localizations.localeOf(globalNavigatorKey.currentState!.context).toString() == "ar"
        //     // ?
        "انتهت فترة صلاحية تسجيل الدخول",
            // : "Your login has expired."),
      );

      return; // stop here
    }
    return handler.next(err);
  }
}

class StatusCode {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internetServerError = 500;
}
