// ignore_for_file: constant_identifier_names

class ProductQuery {
  static const String TABLE_NAME = "product";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( product_id TEXT PRIMARY KEY, product_name TEXT, product_type TEXT, product_group TEXT, product_weight TEXT, uom TEXT, dnr_code TEXT, sap_code TEXT, price TEXT, is_ppn_include TEXT, product_weight_uom TEXT ) ";
  static const String SELECT = "select * from $TABLE_NAME";
}
