import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }
  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'mcc_db.db'),
        onCreate: (db,version) async {
      await db.execute('''
      CREATE TABLE newTable (name text, age text)
      ''');
    },version: 1);
  }

  newData(String name, String age) async {
    final db = await database;
    await db.rawInsert('''INSERT INTO newTable (name,age) VALUES (?,?)''',[name,age]);
  }

  listData() async {
    final db = await database;
    var res = await db.query("newTable");
    return await res;
  }
}