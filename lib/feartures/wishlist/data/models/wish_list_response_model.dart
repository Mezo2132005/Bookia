
class WishListResponseModel {
  WishListDataModel? data;
  String? message;
  List<dynamic>? error;
  int? status;

  WishListResponseModel({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  WishListResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? WishListDataModel.fromJson(json['data'])
        : null;
    message = json['message'];
    error = json['error'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}

class WishListDataModel {
  int? currentPage;
  List<WishListProductModel>? products;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<WishListLinkModel>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  WishListDataModel({
    this.currentPage,
    this.products,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  WishListDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    products = json['data'] != null
        ? (json['data'] as List)
            .map((e) => WishListProductModel.fromJson(e))
            .toList()
        : [];

    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    links = json['links'] != null
        ? (json['links'] as List)
            .map((e) => WishListLinkModel.fromJson(e))
            .toList()
        : [];

    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': products?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
}

class WishListProductModel {
  int? id;
  String? name;
  String? price;
  String? category;
  String? image;
  int? discount;
  int? stock;
  String? description;
  int? bestSeller;

  WishListProductModel({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
    this.discount,
    this.stock,
    this.description,
    this.bestSeller,
  });

  WishListProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    discount = json['discount'];
    stock = json['stock'];
    description = json['description'];
    bestSeller = json['best_seller'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'category': category,
        'image': image,
        'discount': discount,
        'stock': stock,
        'description': description,
        'best_seller': bestSeller,
      };
}

class WishListLinkModel {
  String? url;
  String? label;
  bool? active;

  WishListLinkModel({
    this.url,
    this.label,
    this.active,
  });

  WishListLinkModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };
}
