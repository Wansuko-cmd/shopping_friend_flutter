import 'package:sqflite/sqflite.dart';

class DatabaseBuilder{

  static Database? _db;

  Future<Database> getDatabase() async {

    if(_db != null) return _db!;

    _db = await _initializeDatabase();

    return _db!;
  }

  Future<Database> _initializeDatabase() async
    => await openDatabase(
          'shopping_friend_database',
          onCreate: _onCreateDatabase,
          version: 1
      );

  void _onCreateDatabase(Database db, int version) async{
    await db.execute('''
        CREATE TABLE TitleModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
        )
        ''');

    await db.execute('''
        CREATE TABLE ContentModel(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title_id INTEGER REFERENCES TitleModel(id) ON DELETE CASCADE,
        is_checked INTEGER,
        item TEXT,
        number INTEGER
        )
        ''');
  }
}