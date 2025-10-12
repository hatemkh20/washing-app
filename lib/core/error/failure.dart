import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final Map<String, dynamic>? data;

  const Failure({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

//! Auth
class AuthFailure extends Failure {
  const AuthFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}
 //! Profile
class ProfileFailure extends Failure {
  const ProfileFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Home
class HomeFailure extends Failure {
  const HomeFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}
//! Update Password
class UpdatePasswordFailure extends Failure {
  const UpdatePasswordFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}
//! Contact US
class ContactUsFailure extends Failure {
  const ContactUsFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Get Cart

class CartFailure extends Failure {
  const CartFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}
//! Favourite
class FavouriteFailure extends Failure {
  const FavouriteFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Address
class AddressFailure extends Failure {
  const AddressFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Requests
class RequestsFailure extends Failure {
  const RequestsFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Notification
class NotificationFailure extends Failure {
  const NotificationFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}

//! Search
class SearchFailure extends Failure {
  const SearchFailure({
    super.message,
    super.data,
  });

  @override
  List<Object?> get props => [message, data];
}
//! More Failure
class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.data});
  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure()
      : super(message: 'Location permissions are denied');
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({super.message, super.data});
  @override
  List<Object?> get props => [message, data];
}
