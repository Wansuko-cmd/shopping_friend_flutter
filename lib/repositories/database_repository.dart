import 'package:shopping_friend_flutter/db/AppDatabase.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class DatabaseRepository implements DatabaseRepositoryInterface{


  static final _appDatabase = AppDatabase();


  ///TitleModel
  @override
  Future<TitleModel> insertTitleModel(TitleModel titleModel)
    => _appDatabase.insertTitleModel(titleModel);

  @override
  Future<List<TitleModel>> getAllTitleModels()
    => _appDatabase.getAllTitleModels();

  @override
  Future<TitleModel> findTitleModel(int titleId)
    => _appDatabase.findTitleModel(titleId);

  @override
  Future<int> deleteTitleModel(int titleId)
    => _appDatabase.deleteTitleModel(titleId);



  ///ContentModel
  @override
  Future<ContentModel> insertContentModel(ContentModel contentModel)
    => _appDatabase.insertContentModel(contentModel);

  @override
  Future<List<ContentModel>> findContentModelsByTitleId(int titleId)
    => _appDatabase.findContentModelsByTitleId(titleId);

  @override
  void updateContentModels(List<ContentModel> contentModels)
    => _appDatabase.updateContentModels(contentModels);

  @override
  void deleteContentModels(List<ContentModel> contentModels)
    => _appDatabase.deleteContentModels(contentModels);
}