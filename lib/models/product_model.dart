// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.statusCode,
    required this.statusMessageInd,
    required this.statusMessageEng,
    required this.valueProduct,
  });

  String statusCode;
  String statusMessageInd;
  String statusMessageEng;
  List<ValueProduct> valueProduct;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        statusCode: json["status_code"],
        statusMessageInd: json["status_message_ind"],
        statusMessageEng: json["status_message_eng"],
        valueProduct: List<ValueProduct>.from(
            json["value"].map((x) => ValueProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message_ind": statusMessageInd,
        "status_message_eng": statusMessageEng,
        "value": List<dynamic>.from(valueProduct.map((x) => x.toJson())),
      };
}

class ValueProduct {
  ValueProduct(
      {required this.productId,
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
      this.branchId});

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
  String? branchId;

  factory ValueProduct.fromJson(Map<String, dynamic> json) => ValueProduct(
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
        branchId: json["branch_id"],
      );

  Map<String, Object> toJson() => {
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
