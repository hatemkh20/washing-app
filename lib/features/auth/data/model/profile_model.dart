class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  Data({required this.profile});
  late final Profile profile;

  Data.fromJson(Map<String, dynamic> json) {
    profile = Profile.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profile'] = profile.toJson();
    return _data;
  }
}

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String type;
  late final String image;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['type'] = type;
    _data['image'] = image;
    return _data;
  }
}
