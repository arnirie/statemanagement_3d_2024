import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:statemanagement_3d/models/product.dart';

class DbHelper {
  //constants
  static final dbName = 'products.db';
  static final dbVersion = 1;
  //product table
  static final tbProduct = 'product';
  static final prodCode = 'code';
  static final prodName = 'nameDesc';
  static final prodPrice = 'price';

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);
    var sql =
        'CREATE TABLE IF NOT EXISTS $tbProduct ($prodCode TEXT PRIMARY KEY, $prodName TEXT NOT NULL, $prodPrice DECIMAL(10,2))';
    var db = await openDatabase(
      path,
      version: dbVersion,
      singleInstance: true,
      onCreate: (db, version) {
        db.execute(sql);
        print('$tbProduct created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (newVersion > oldVersion) {
          db.execute('DROP TABLE IF EXISTS $tbProduct');
          db.execute(sql);
        }
      },
    );
    return db;
  }

  static Future<void> insertProduct(Product product) async {
    final db = await openDb();
    await db.insert(tbProduct, product.toMap());
    print('inserted product');
  }

  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final db = await openDb();
    print('fetched from $tbProduct');
    return await db.query(tbProduct);
  }
}
