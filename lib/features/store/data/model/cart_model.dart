class CartModel   {
  CartModel  ({
    required this.status,
    required this.message,
    required this.data,
    this.meta,
  });
  late final bool status;
  late final String message;
  late final Data data;
  late final dynamic meta;

  CartModel  .fromJson(Map<String, dynamic> json){
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
    required this.cartItems,
  });
  late final List<CartItems> cartItems;

  Data.fromJson(Map<String, dynamic> json){
    cartItems = List.from(json['cart_items']).map((e)=>CartItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_items'] = cartItems.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CartItems {
  CartItems({
    required this.id,
    required this.product,
     this.quantity = 0,
    required this.totalPrice,
  });
  late final int id;
  late final Product product;
  late int  quantity;
  late final int totalPrice;

  CartItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product = Product.fromJson(json['product']);
    quantity =(json['quantity'] != null) ?json['quantity'] : null;
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product'] = product.toJson();
    _data['quantity'] = quantity;
    _data['total_price'] = totalPrice;
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isFavorite,
    required this.inCart,
  });
  late final int id;
  late final String name;
  late final String price;
  late final String image;
  late final bool isFavorite;
  late final bool inCart;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    isFavorite = json['is_favorite'];
    inCart = json['in_cart'];
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