// ignore_for_file: constant_identifier_names

class PriceQuery {
  static const String TABLE_NAME = "price";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( product_id TEXT PRIMARY KEY, price TEXT, branch_id TEXT ) ";
  static const String SELECT = "select * from $TABLE_NAME";
}
