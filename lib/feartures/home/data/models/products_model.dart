
class ProductsModel {
  final ProductsData data;
  final String message;
  final List<dynamic> error;
  final int status;

  ProductsModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      data: ProductsData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'] ?? 0,
    );
  }
}

class ProductsData {
  final List<ProductModel> products;

  ProductsData({required this.products});

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      products: (json['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int discount;
  final double priceAfterDiscount;
  final int stock;
  final int bestSeller;
  final String image;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.bestSeller,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: double.parse(json['price'].toString()),
      discount: json['discount'] ?? 0,
      priceAfterDiscount:
          (json['price_after_discount'] as num).toDouble(),
      stock: json['stock'] ?? 0,
      bestSeller: json['best_seller'] ?? 0,
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'price_after_discount': priceAfterDiscount,
      'stock': stock,
      'best_seller': bestSeller,
      'image': image,
      'category': category,
    };
  }
}
