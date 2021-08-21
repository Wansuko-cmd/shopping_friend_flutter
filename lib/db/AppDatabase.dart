import 'package:shopping_friend_flutter/db/dao/content_model/content_model_dao_interface.dart';
import 'package:shopping_friend_flutter/db/dao/initialize/database_builder.dart';
import 'package:shopping_friend_flutter/db/dao/title_model/title_model_dao.dart';
import 'package:shopping_friend_flutter/db/dao/title_model/title_model_dao_interface.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/content_model/content_model_dao.dart';

class AppDatabase{

  ///使用するDatabaseのインスタンス
  Future<Database> get _db => _databaseBuilder.getDatabase();

  ///Databaseを取得するためのインスタンス
  late final DatabaseBuilder _databaseBuilder;

  ///それぞれのカラムのDaoのインスタンス
  late final TitleModelDaoInterface _titleModelDao;
  late final ContentModelDaoInterface _contentModelDao;

  AppDatabase(){
    _databaseBuilder = DatabaseBuilder();

    _titleModelDao = TitleModelDao();
    _contentModelDao = ContentModelDao();
  }

  /// TitleModel
  Future<TitleModel> insertTitleModel(TitleModel titleModel) async
    => _titleModelDao.insert(await _db, titleModel);

  Future<List<TitleModel>> getAllTitleModels() async
    => _titleModelDao.getAll(await _db);

  Future<TitleModel> findTitleModel(int id) async
    => _titleModelDao.find(await _db, id);

  Future<int> deleteTitleModel(int id) async
   => _titleModelDao.delete(await _db, id);



  /// ContentModel
  Future<ContentModel> insertContentModel(ContentModel contentModel) async
    => _contentModelDao.insert(await _db, contentModel);

  Future<List<ContentModel>> findContentModelsByTitleId(int titleId) async
   => _contentModelDao.findContentModelsByTitleId(await _db, titleId);

  void updateContentModels(List<ContentModel> contentModels) async
    => _contentModelDao.update(await _db, contentModels);

  void deleteContentModels(List<ContentModel> contentModels) async
    => _contentModelDao.delete(await _db, contentModels);
}