import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  final String tableTitleModel = 'TitleModel';
  final String tableContentModel = 'ContentModel';

  AppDatabase(){
    initDatabase();
  }

  initDatabase() async{
    return await openDatabase(
      'shopping_friend_database',
      onCreate: _onCreateDatabase,
      version: 1,
    );
  }

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
        title_id INTEGER REFERENCES TitleModel(id),
        is_checked INTEGER,
        item TEXT,
        number INTEGER
        )
        ''');
  }

  Future<int> insertTitle(String name) async{

    final Map<String, dynamic> row = {
      'name': name
    };

    var dbClient = await db;

    final id = await dbClient.insert(tableTitleModel, row);

    return id;
  }

  Future<int> insertContent(ContentModel contentModel) async{
    final Map<String, dynamic> row = {
      'title_id': contentModel.titleId,
      'is_checked': contentModel.isChecked ? 1 : 0,
      'item': contentModel.item,
      'number': contentModel.number
    };

    var dbClient = await db;

    final id = await dbClient.insert(tableContentModel, row);

    return id;
  }

  Future<List<TitleModel>> getTitleModels() async{
    var dbClient = await db;

    var result = await dbClient.query(tableTitleModel);

    return result.map((e) => TitleModel.fromMap(e)).toList();
  }

  Future<TitleModel> getTitleModelById(int id) async{
    var dbClient = await db;

    var result = await dbClient.query(tableTitleModel,
      where: 'id = ?',
      whereArgs: [id]
    );

    return TitleModel.fromMap(result.first);
  }

  Future<List<ContentModel>> getContentModelsByTitleId(int titleId) async{
    var dbClient = await db;

    print(titleId);

    var result = await dbClient.query(tableContentModel,
      where: 'title_id = ?',
      whereArgs: [titleId]
    );

    List<ContentModel> contents = result.map((e) => ContentModel.fromMap(e)).toList();

    return contents;
  }

  Future<int> deleteTitleModel(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableTitleModel, where: 'id = ?', whereArgs: [id]);
  }
}