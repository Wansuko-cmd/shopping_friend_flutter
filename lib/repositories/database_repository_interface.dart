import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';

abstract class DatabaseRepositoryInterface{

  ///TitleModel
  Future<TitleModel> insertTitleModel(TitleModel titleModel);

  Future<List<TitleModel>> getAllTitleModels();

  Future<TitleModel> findTitleModel(int titleId);

  Future<int> deleteTitleModel(int titleId);


  ///ContentModel
  Future<ContentModel> insertContentModel(ContentModel contentModel);

  Future<List<ContentModel>> findContentModelsByTitleId(int titleId);

  void updateContentModels(List<ContentModel> contentModels);

  Future<int> deleteContentModel(int contentId);
}