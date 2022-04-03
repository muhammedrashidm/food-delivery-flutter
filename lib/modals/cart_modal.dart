import 'dart:convert';
import 'package:food_delivery/modals/products_modal.dart';

CartModal cartModalFromJson(String str) => CartModal.fromJson(json.decode(str));

String cartModalToJson(CartModal data) => json.encode(data.toJson());

class CartModal {
  CartModal({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModal? product;

  factory CartModal.fromJson(Map<String, dynamic> json) => CartModal(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        img: json["img"],
        quantity: json["quantity"],
        isExist: json["isExist"],
        time: json["time"],
        product: json["product"] == null
            ? null
            : ProductModal.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "img": img,
        "quantity": quantity,
        "isExist": isExist,
        "time": time,
        "product": product,
      };
}
