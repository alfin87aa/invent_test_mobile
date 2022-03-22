// To parsethis JSON data, do
//
//     final priceModel = priceModelFromJson(jsonString);

import 'dart:convert';

List<PriceModel> priceModelFromJson(String str) =>
    List<PriceModel>.from(json.decode(str).map((x) => PriceModel.fromJson(x)));

String priceModelToJson(List<PriceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PriceModel {
  PriceModel({
    required this.productId,
    required this.price,
    required this.branchId,
  });

  String productId;
  String price;
  String branchId;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        productId: json["product_id"],
        price: json["price"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "price": price,
        "branch_id": branchId,
      };
}
