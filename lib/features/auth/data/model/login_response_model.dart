class LoginResponseModel  {
  LoginResponseModel ({
    required this.message,
    required this.user,
    required this.token,
  });
  late final String message;
  late final User user;
  late final String token;
    String ? statues;

  LoginResponseModel .fromJson(Map<String, dynamic> json){
    message = json['message'];
    user = User.fromJson(json['user']);
    token = json['token'];
    statues = (statues != null) ? json['token'] : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user'] = user.toJson();
    _data['token'] = token;
    _data['statues'] = statues;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String role;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['role'] = role;
    return _data;
  }
}