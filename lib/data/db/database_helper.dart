import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _instance;
  static Database _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblDestinatinFavorite = 'destination_favorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/capstone_project_jti_apps.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblDestinatinFavorite (
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
                id TEXT PRIMARY KEY
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

  /* Destination Database */

  Future<void> addDestinationFavorite(DestinationResult destination) async {
    final db = await database;
    var destinationInsert = destination.toJson();
    await db.insert(_tblDestinatinFavorite, destinationInsert);
  }

  Future<List<DestinationResult>> getDestinationFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblDestinatinFavorite);

    return results.map((res) => DestinationResult.fromJson(res)).toList();
  }

  Future<Map> getDestinationFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db
        .query(_tblDestinatinFavorite, where: 'id = ?', whereArgs: [id]);

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeDestinationFavorite(String id) async {
    final db = await database;

    await db.delete(
      _tblDestinatinFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /* End Destination Database */
}
