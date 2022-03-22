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
        onCreate: (db, version) {
      tables.forEach((table) async {
        await db.execute(table).then((value) {
          if (kDebugMode) {
            print("berashil ");
          }
        }).catchError((err) {
          if (kDebugMode) {
            print("errornya ${err.toString()}");
          }
        });
      });
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

  Future<List> getData(String tableName) async {
    final db = await openDB();
    var result = await db.query(tableName);
    return result.toList();
  }
}
