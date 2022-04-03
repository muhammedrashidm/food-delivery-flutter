import 'dart:convert';

ProductsModal productsModalFromJson(String str) =>
    ProductsModal.fromJson(json.decode(str));

String productsModalToJson(ProductsModal data) => json.encode(data.toJson());

class ProductsModal {
  ProductsModal({
    this.totalSize,
    this.typeId,
    this.offset,
    this.products,
  });
  List<ProductModal>? get productsList => products;
  int? totalSize;
  int? typeId;
  int? offset;
  List<ProductModal>? products;

  factory ProductsModal.fromJson(Map<String, dynamic> json) => ProductsModal(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<ProductModal>.from(
            json["products"].map((x) => ProductModal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "type_id": typeId,
        "offset": offset,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class ProductModal {
  ProductModal({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? typeId;

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeId: json["type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt?.toString(),
        "updated_at": updatedAt?.toString(),
        "type_id": typeId,
      };
}
