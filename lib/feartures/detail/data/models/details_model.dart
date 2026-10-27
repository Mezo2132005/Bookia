
class DetailsModel {
  final DetailsData? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  DetailsModel({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      data: json['data'] != null
          ? DetailsData.fromJson(json['data'])
          : null,
      message: json['message'],
      error: json['error'],
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

class DetailsData {
  final int? id;
  final String? name;
  final String? description;
  final int? stock;
  final int? bestSeller;
  final String? price;
  final int? discount;
  final double? priceAfterDiscount;
  final String? image;
  final String? category;

  DetailsData({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.bestSeller,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.image,
    this.category,
  });

  factory DetailsData.fromJson(Map<String, dynamic> json) {
    return DetailsData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      stock: json['stock'],
      bestSeller: json['best_seller'],
      price: json['price']?.toString(),
      discount: json['discount'],
      priceAfterDiscount:
          (json['price_after_discount'] as num?)?.toDouble(),
      image: json['image'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stock': stock,
      'best_seller': bestSeller,
      'price': price,
      'discount': discount,
      'price_after_discount': priceAfterDiscount,
      'image': image,
      'category': category,
    };
  }
}
