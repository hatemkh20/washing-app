class UserDataRequest {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String password;

  const UserDataRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
  });

  // ⬅ إنشاء نسخة جديدة مع إمكانية تعديل قيمة واحدة فقط
  UserDataRequest copyWith({
    String? name,
    String? phone,
    String? email,
    String? address,
    String? password,
  }) {
    return UserDataRequest(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      password: password ?? this.password,
    );
  }

  factory UserDataRequest.fromJson(Map<String, dynamic> json) {
    return UserDataRequest(
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      password: json["password"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
      "password": password,
    };
  }

  @override
  String toString() {
    return 'UserDataRequest{name: $name, phone: $phone, email: $email, address: $address, password: $password}';
  }
}
