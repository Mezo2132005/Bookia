
class ProfileResponseModel {
  ProfileDataModel? data;
  String? message;
  List<dynamic>? error;
  int? status;

  ProfileResponseModel({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? ProfileDataModel.fromJson(json['data'])
        : null;
    message = json['message'];
    error = json['error'];
    status = json['status'];
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

class ProfileDataModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  bool? emailVerified;
  String? image;

  ProfileDataModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    phone = json['phone'];
    emailVerified = json['email_verified'];
    image = json['image'];
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
