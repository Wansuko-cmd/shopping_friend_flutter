import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class DatabaseRepository implements DatabaseRepositoryInterface{

  final titles = [TitleModel(1, "Title1"), TitleModel(2, "Title2"), TitleModel(3, "Title3")];
  List<ContentModel> contents = [
    ContentModel(1, 1, false, "Item1", 1),
    ContentModel(2, 1, false, "Item2", 2),
    ContentModel(3, 1, false, "Item3", 3),
    ContentModel(4, 1, false, "Item4", 4),
    ContentModel(5, 1, false, "Item5", 5),
  ];

  @override
  void deleteContent(int contentId) {
    contents.removeWhere((element) => element.id == contentId);
  }

  @override
  void deleteTitle(int titleId) {
    titles.removeWhere((element) => element.id == titleId);
  }

  @override
  Future<List<ContentModel>> getContentsByTitleId(int titleId) {
    return Future.value(contents.where((element) => element.titleId == titleId).toList());
  }

  @override
  Future<TitleModel> findTitle(int titleId) {
    return Future.value(titles.firstWhere((element) => element.id == titleId));
  }

  @override
  Future<List<TitleModel>> getAllTitles() {
    return Future.delayed(const Duration(seconds: 1)).then((value) => titles);
    // return Future.value(titles);
  }
}