import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class TitleModelDaoInterface{

  Future<TitleModel> insert(Database db, TitleModel titleModel);

  Future<List<TitleModel>> getAll(Database db);

  Future<TitleModel> find(Database db, int id);

  Future<int> delete(Database db, int id);
}