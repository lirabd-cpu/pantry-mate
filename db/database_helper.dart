import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/item_model.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final instance = DatabaseHelper._();

  Database? _db;

  Future<Database> get db async {
    _db ??= await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), "pantry.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            quantity REAL,
            unit TEXT,
            category TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertItem(Item item) async {
    final database = await db;
    await database.insert("items", item.toMap());
  }

  Future<List<Item>> getItems() async {
    final database = await db;
    final result = await database.query("items");
    return result.map((e) => Item.fromMap(e)).toList();
  }
}
