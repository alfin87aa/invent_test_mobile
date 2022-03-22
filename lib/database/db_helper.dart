import 'package:path/path.dart' as path;
import '../index.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._singleton();

  factory DbHelper() {
    return _dbHelper;
  }

  DbHelper._singleton();

  final tables = [
    PriceQuery.CREATE_TABLE,
    ProductQuery.CREATE_TABLE
  ]; // membuat daftar table yang akan dibuat

  Future<Database> openDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(path.join(dbPath, 'thengoding.db'),
        onCreate: (db, version) async {
      for (var table in tables) {
        await db.execute(table).then((value) {
          Get.snackbar(
            'Sukses',
            'Database berhasil di buat',
            margin: const EdgeInsets.only(top: 50.0),
            duration: const Duration(seconds: 1),
          );
        }).catchError((err) {
          Get.snackbar(
            'Error',
            err,
            margin: const EdgeInsets.only(top: 50.0),
            duration: const Duration(seconds: 1),
          );
        });
      }
      if (kDebugMode) {
        print('Table Created');
      }
    }, version: 1);
  }

  insert(String table, Map<String, Object> data) {
    openDB().then((db) {
      db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    }).catchError((err) {
      if (kDebugMode) {
        print("error $err");
      }
    });
  }

  delete(String table) {
    openDB().then((db) {
      db.delete(table);
    }).catchError((err) {
      if (kDebugMode) {
        print("error $err");
      }
    });
  }

  Future<List> getData(String tableName) async {
    final db = await openDB();
    var result = await db.query(tableName);
    return result.toList();
  }

  Future<List> getProductPrice(String tableName) async {
    final db = await openDB();
    var result = db.rawQuery(
        'SELECT product.product_id, product.product_name, product.product_type, product.product_group, product.product_weight, product.product_weight, product.uom, product.dnr_code, product.sap_code, product.is_ppn_include, product.product_weight_uom, price.price, price.branch_id FROM product INNER JOIN items ON product.product_id = price.product_id');
    return result;
  }
}
