import 'package:shopping_friend_flutter/db/dao/content_model/content_model_dao_interface.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ContentModelDao implements ContentModelDaoInterface{

  final String table = 'ContentModel';

  @override
  Future<ContentModel> insert(Database db, ContentModel contentModel) async{
    final Map<String, dynamic> row = {
      'title_id': contentModel.titleId,
      'is_checked': contentModel.isChecked ? 1 : 0,
      'item': contentModel.item,
      'number': contentModel.number
    };

    final id = await db.insert(table, row);

    return ContentModel(
        id: id,
        titleId: contentModel.titleId,
        isChecked: contentModel.isChecked,
        item: contentModel.item,
        number: contentModel.number
    );
  }


  @override
  Future<List<ContentModel>> findContentModelsByTitleId(Database db, int titleId) async{
    final contents = await db.query(table,
      where: 'title_id = ?',
      whereArgs: [titleId]
    );

    return contents.map((e) => ContentModel.fromMap(e)).toList();
  }

  @override
  void update(Database db, List<ContentModel> contentModels) async{

    await db.transaction((txn) async{
      contentModels.forEach((element) async {
        await txn.update(table,
            element.toMap(),
            where: 'id = ?',
            whereArgs: [element.id]
        );
      });
    });
  }


  @override
  void delete(Database db, List<ContentModel> contentModels) async{

    await db.transaction((txn) async{
      contentModels.forEach((element) async{
        await db.delete(table,
            where: 'id = ?',
            whereArgs: [element.id]
        );
      });
    });
  }
}