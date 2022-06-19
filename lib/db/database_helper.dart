/*import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _instance;
  static Database _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblFavorite = 'favorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/capstone_project-JTI_apps.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
          name TEXT,
          image TEXT,
          description TEXT,
          address TEXT,
          city TEXT,
          province TEXT,
          postalCode INTEGER,
          telephone INTEGER,
          openTime TEXT,
          openDay TEXT,
          ticket INTEGER,
          website TEXT,
          instagram TEXT,
          cloudinaryId TEXT,
          id TEXT PRIMARY KEY, 
        )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database> get database async {
    _database = await _initializeDb();

    return _database;
  }

  Future<void> addFavorite(DestinationElement destination) async {
    final db = await database;
    var destinationInsert = destination.toJson();
    await db.insert(_tblFavorite, destinationInsert);
  }

  Future<List<DestinationElement>> getFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblFavorite);

    return results.map((res) => DestinationElement.fromJson(res)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id]
      );

      if (results.isNotEmpty) {
        return results.first;
      } else {
        return {};
      }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}*/