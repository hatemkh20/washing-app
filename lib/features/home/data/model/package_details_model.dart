class PackageDetailsModel {
  PackageDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  PackageDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({required this.package});
  late final Package package;

  Data.fromJson(Map<String, dynamic> json) {
    package = Package.fromJson(json['package']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['package'] = package.toJson();
    return _data;
  }
}

class Package {
  Package({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.hasDiscount,
    required this.features,
    required this.durationDays,
    required this.ordersCount,
  });
  late final int id;
  late final String title;
  late final String price;
  late final String discount;
  late final bool hasDiscount;
  late final List<String> features;
  late final int durationDays;
  late final int ordersCount;

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    hasDiscount = json['has_discount'];
    features = List.castFrom<dynamic, String>(json['features']);
    durationDays = json['duration_days'];
    ordersCount = json['orders_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['discount'] = discount;
    _data['has_discount'] = hasDiscount;
    _data['features'] = features;
    _data['duration_days'] = durationDays;
    _data['orders_count'] = ordersCount;
    return _data;
  }
}
