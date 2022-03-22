// To parse this JSON data, do
//
//     final priceModel = priceModelFromJson(jsonString);

import 'dart:convert';

PriceModel priceModelFromJson(String str) =>
    PriceModel.fromJson(json.decode(str));

String priceModelToJson(PriceModel data) => json.encode(data.toJson());

class PriceModel {
  PriceModel({
    required this.statusCode,
    required this.statusMessageInd,
    required this.statusMessageEng,
    required this.valuePrice,
  });

  String statusCode;
  String statusMessageInd;
  String statusMessageEng;
  List<ValuePrice> valuePrice;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        statusCode: json["status_code"],
        statusMessageInd: json["status_message_ind"],
        statusMessageEng: json["status_message_eng"],
        valuePrice: List<ValuePrice>.from(
            json["value"].map((x) => ValuePrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message_ind": statusMessageInd,
        "status_message_eng": statusMessageEng,
        "value": List<dynamic>.from(valuePrice.map((x) => x.toJson())),
      };
}

class ValuePrice {
  ValuePrice({
    required this.productId,
    required this.price,
    required this.branchId,
  });

  String productId;
  String price;
  String branchId;

  factory ValuePrice.fromJson(Map<String, dynamic> json) => ValuePrice(
        productId: json["product_id"],
        price: json["price"],
        branchId: json["branch_id"],
      );

  Map<String, Object> toJson() => {
        "product_id": productId,
        "price": price,
        "branch_id": branchId,
      };
}
