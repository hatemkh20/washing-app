class StoreModel  {
  StoreModel ({
    required this.status,
    required this.message,
    required this.data,
    this.meta,
  });
  late final bool status;
  late final String message;
  late final Data data;
  late final dynamic meta;

  StoreModel .fromJson(Map<String, dynamic> json){
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
  Data({
    required this.favorites,
  });
  late final List<Favorites> favorites;

  Data.fromJson(Map<String, dynamic> json){
    favorites = List.from(json['favorites']).map((e)=>Favorites.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['favorites'] = favorites.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Favorites {
  Favorites({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isFavorite,
    required this.inCart,
  });
  late final int id;
  late final String name;
  late final dynamic price;
  late final String image;
   bool ? isFavorite;
 bool  ? inCart;

  Favorites.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    isFavorite = ( json['is_favorite'] != null) ? json['is_favorite'] : null;
    inCart =(json['in_cart'] != null) ?json['in_cart'] : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['image'] = image;
    _data['is_favorite'] = isFavorite;
    _data['in_cart'] = inCart;
    return _data;
  }
}