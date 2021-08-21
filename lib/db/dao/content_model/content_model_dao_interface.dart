import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ContentModelDaoInterface{

  Future<ContentModel> insert(Database db, ContentModel contentModel);

  Future<List<ContentModel>> findContentModelsByTitleId(Database db, int titleId);

  Future<int> delete(Database db, int id);
}