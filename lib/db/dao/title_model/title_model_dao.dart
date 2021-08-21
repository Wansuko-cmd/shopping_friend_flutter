import 'package:shopping_friend_flutter/db/dao/title_model/title_model_dao_interface.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:sqflite/sqflite.dart';

class TitleModelDao implements TitleModelDaoInterface{

  final String table = 'TitleModel';

  @override
  Future<TitleModel> insert(Database db, TitleModel titleModel) async{

    final Map<String, dynamic> row = {
      'name': titleModel.name
    };

    final id = await db.insert(table, row);

    return TitleModel(id: id, name: titleModel.name);
  }

  @override
  Future<List<TitleModel>> getAll(Database db) async{

    final titles = await db.query(table);

    return titles.map((e) => TitleModel.fromMap(e)).toList();
  }

  @override
  Future<TitleModel> find(Database db, int id) async{

    final title = await db.query(table,
      where: 'id = ?',
      whereArgs: [id]
    );

    return TitleModel.fromMap(title.first);
  }

  @override
  Future<int> delete(Database db, int id) async{

    return await db.delete(table,
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}