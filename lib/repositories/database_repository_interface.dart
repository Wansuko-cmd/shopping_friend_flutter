import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';

abstract class DatabaseRepositoryInterface{

  Future<List<TitleModel>> getAllTitles();

  Future<TitleModel> findTitle(int titleId);

  void deleteTitle(int titleId);


 Future<List<ContentModel>> findContentsByTitleId(int titleId);

  void deleteContent(int contentId);
}