class CheckUserModel {
  CheckUserModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  CheckUserModel.fromJson(Map<String, dynamic> json) {
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
  Data({required this.emailExists, required this.phoneExists});
  late final bool emailExists;
  late final bool phoneExists;

  Data.fromJson(Map<String, dynamic> json) {
    emailExists = json['email_exists'];
    phoneExists = json['phone_exists'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email_exists'] = emailExists;
    _data['phone_exists'] = phoneExists;
    return _data;
  }
}
