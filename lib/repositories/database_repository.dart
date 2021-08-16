import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class DatabaseRepository implements DatabaseRepositoryInterface{

  List<TitleModel> titles = [];
  List<ContentModel> contents = [];

  @override
  void deleteContent(int contentId) {
    contents.removeWhere((element) => element.id == contentId);
  }

  @override
  void deleteTitle(int titleId) {
    titles.removeWhere((element) => element.id == titleId);
  }

  @override
  List<ContentModel> findContentsByTitleId(int titleId) {
    return contents.where((element) => element.titleId == titleId).toList();
  }

  @override
  TitleModel findTitle(int titleId) {
    return titles.firstWhere((element) => element.id == titleId);
  }

  @override
  List<TitleModel> getAllTitles() {
    return titles;
  }
}