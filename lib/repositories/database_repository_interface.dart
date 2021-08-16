import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';

abstract class DatabaseRepositoryInterface{

  List<TitleModel> getAllTitles();

  TitleModel findTitle(int titleId);

  void deleteTitle(int titleId);


  List<ContentModel> findContentsByTitleId(int titleId);

  void deleteContent(int contentId);
}