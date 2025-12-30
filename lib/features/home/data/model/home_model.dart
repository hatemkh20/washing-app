class HomeModel {
  HomeModel({
    required this.status,
    required this.message,
    required this.data,
    this.meta,
  });
  late final bool status;
  late final String message;
  late final Data data;
  late final Null meta;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    meta = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['meta'] = meta;
    return _data;
  }
}

class Data {
  Data({required this.home});
  late final Home home;

  Data.fromJson(Map<String, dynamic> json) {
    home = Home.fromJson(json['home']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['home'] = home.toJson();
    return _data;
  }
}

class Home {
  Home({
    required this.sliders,
    required this.services,
    required this.products,
    required this.packages,
  });
  late final List<Sliders> sliders;
  late final List<Services> services;
  late final List<Products> products;
  late final List<Packages> packages;

  Home.fromJson(Map<String, dynamic> json) {
    sliders =
        List.from(json['sliders']).map((e) => Sliders.fromJson(e)).toList();
    services =
        List.from(json['services']).map((e) => Services.fromJson(e)).toList();
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    packages =
        List.from(json['packages']).map((e) => Packages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sliders'] = sliders.map((e) => e.toJson()).toList();
    _data['services'] = services.map((e) => e.toJson()).toList();
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['packages'] = packages.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Sliders {
  Sliders({required this.id, required this.image});
  late final int id;
  late final String image;

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    return _data;
  }
}

class Services {
  Services({required this.id, required this.name, required this.image});
  late final int id;
  late final String name;
  late final String image;

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.isFavorite,
    this.isCart,
  });
  late final int id;
  late final String name;
  late final String price;
  late final String image;
  bool? isFavorite;
  bool? isCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    isFavorite =(json['is_favorite'] != null) ?  json['is_favorite'] : null;
    isCart =(json['in_cart'] != null) ?  json['in_cart'] : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['image'] = image;
    _data['is_favorite'] = isFavorite;
    return _data;
  }
}

class Packages {
  Packages({
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

  Packages.fromJson(Map<String, dynamic> json) {
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
