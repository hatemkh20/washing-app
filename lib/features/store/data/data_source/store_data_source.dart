import 'package:dio/dio.dart';

import '../../../../core/error/handel_error.dart';
import '../../../../core/networking/dio_factory.dart';

class StoreDataSource{
  Future<Response> getFavDataSource() async {
    try {
      Response response = await DioFactory.dio!.get(
        "/favorites",
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> addFavDataSource({required int id}) async {
    try {
      Response response = await DioFactory.dio!.post(
        "/favorites/${id}",
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> addCartDataSource({required int id , required int quantity}) async {
    try {
      Response response = await DioFactory.dio!.post(
        "/cart",
        data: {
          "product_id": id,
          "quantity": quantity
        }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> deleteCartDataSource({required int id }) async {
    try {
      Response response = await DioFactory.dio!.delete(
          "/cart/${id}",
        // queryParameters: {
        //     "cartId" : id,
        // }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> getCartDataSource() async {
    try {
      Response response = await DioFactory.dio!.get(
          "/cart",
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> updateCartDataSource({required int id , required int quantity }) async {
    try {
      Response response = await DioFactory.dio!.put(
          "/cart/${id}",
          // queryParameters: {
          //   "cartId" : id,
          // },
        data: {
          "quantity": quantity
        }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> checkoutDataSource({String ? coupon}) async {
    try {
      Response response = await DioFactory.dio!.post(
          "/checkout/cart-pricing",
          data: {
            if(coupon!= null)
            "coupon": coupon,
          }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }

  Future<Response> applyCouponDataSource({String ? coupon}) async {
    try {
      Response response = await DioFactory.dio!.post(
          "/checkout/coupon",
          data: {
            if(coupon!= null)
              "coupon": coupon,
          }
      );
      return response;
    } on DioException catch (error) {
      return handleDioError(error);
    }
  }
}