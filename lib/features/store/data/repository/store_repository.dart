import 'package:clean_point/features/store/data/data_source/store_data_source.dart';
import 'package:clean_point/features/store/data/model/cart_model.dart';
import 'package:clean_point/features/store/data/model/checkout_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/store_model.dart';

class StoreRepository{
  final StoreDataSource storeDataSource;
  StoreRepository({required this.storeDataSource});

  Future<Either<Failure, StoreModel>> getFavRepo() async {
    try {
      final response = await storeDataSource.getFavDataSource();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = StoreModel.fromJson(response.data);
        return Right(data);
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

  Future<Either<Failure, dynamic>> addFavRepo({required int id}) async {
    try {
      final response = await storeDataSource.addFavDataSource(id: id);
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<Either<Failure, dynamic>> addCartRepo({required int id , required int quantity}) async {
    try {
      final response = await storeDataSource.addCartDataSource(id: id, quantity: quantity);
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<Either<Failure, dynamic>> deleteCartRepo({required int id}) async {
    try {
      final response = await storeDataSource.deleteCartDataSource(id: id);
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<Either<Failure, CartModel>> getCartRepo() async {
    try {
      final response = await storeDataSource.getCartDataSource();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data =  CartModel.fromJson(response.data);
        return Right(data);
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

  Future<Either<Failure, dynamic>> updateCartRepo({required int id , required int quantity}) async {
    try {
      final response = await storeDataSource.updateCartDataSource(id: id, quantity: quantity);
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<Either<Failure, CheckoutModel>> checkoutCartRepo({String ? coupon}) async {
    try {
      final response = await storeDataSource.checkoutDataSource(coupon: coupon);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = CheckoutModel.fromJson(response.data);
        return Right(data);
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

  Future<Either<Failure, dynamic>> applyCouponCartRepo({String ? coupon}) async {
    try {
      final response = await storeDataSource.applyCouponDataSource(coupon: coupon);
      if (response.statusCode == 200 || response.statusCode == 201) {
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
}