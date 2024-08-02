import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class QuotesDbService{
  static QuotesDbService quotesDbService = QuotesDbService._();
  QuotesDbService._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database?> createDatabase() async {
    final path = await getDatabasesPath();
    final dataPath = join(path, 'favorite.db');

    _database = await openDatabase(
      dataPath,
      version: 1,
      onCreate: (db, version) {
        String sql = '''
            CREATE TABLE favorite (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            quote TEXT,
            author TEXT,
            isLike INTEGER,
            category TEXT,
         )''';
        db.execute(sql);
      },
    );

    return _database;
  }

  Future<void> insertDatabase(
      String? quotes, String? author, bool? isLiked, String? category) async {
    final db = await database;
    String sql =
        'INSERT INTO favorite (quote,author,isLike,category,image) VALUES(?,?,?,?,?)';
    List arg = [quotes, author, isLiked, category];
    await db!.rawInsert(sql, arg);
  }

  Future<List<Map<String, Object?>>> readDatabase() async {
    final db = await database;
    String sql = '''
    SELECT * FROM favorite
    ''';
    return await db!.rawQuery(sql);
  }

  Future<void> removeDatabase(String quotes) async {
    final db = await database;
    String sql = '''
    DELETE FROM favorite WHERE quote = ?
    ''';
    await db!.rawDelete(sql, [quotes]);
  }
}