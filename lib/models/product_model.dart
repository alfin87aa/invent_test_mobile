// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.productId,
    required this.productName,
    required this.productType,
    required this.productGroup,
    required this.productWeight,
    required this.uom,
    required this.dnrCode,
    required this.sapCode,
    required this.price,
    required this.isPpnInclude,
    required this.productWeightUom,
  });

  String productId;
  String productName;
  String productType;
  String productGroup;
  String productWeight;
  String uom;
  String dnrCode;
  String sapCode;
  String price;
  String isPpnInclude;
  String productWeightUom;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        productType: json["product_type"],
        productGroup: json["product_group"],
        productWeight: json["product_weight"],
        uom: json["uom"],
        dnrCode: json["dnr_code"],
        sapCode: json["sap_code"],
        price: json["price"],
        isPpnInclude: json["is_ppn_include"],
        productWeightUom: json["product_weight_uom"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_type": productType,
        "product_group": productGroup,
        "product_weight": productWeight,
        "uom": uom,
        "dnr_code": dnrCode,
        "sap_code": sapCode,
        "price": price,
        "is_ppn_include": isPpnInclude,
        "product_weight_uom": productWeightUom,
      };
}
