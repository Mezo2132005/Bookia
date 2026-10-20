
class LoginResponseModel {
  final LoginData? data;
  final String? message;
  final List<dynamic> error;
  final int? status;

  LoginResponseModel({
    this.data,
    this.message,
    this.error = const [],
    this.status,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: json['data'] != null
          ? LoginData.fromJson(json['data'])
          : null,
      message: json['message'],
      error: json['error'] ?? [],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}

class LoginData {
  final UserModel? user;
  final String? token;

  LoginData({
    this.user,
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: json['user'] != null
          ? UserModel.fromJson(json['user'])
          : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'token': token,
    };
  }
}

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? phone;
  final bool? emailVerified;
  final String? image;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      emailVerified: json['email_verified'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'email_verified': emailVerified,
      'image': image,
    };
  }
}
