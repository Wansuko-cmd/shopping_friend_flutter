import 'package:shopping_friend_flutter/db/AppDatabase.dart';
import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class DatabaseRepository implements DatabaseRepositoryInterface{

  static final titles = [
    TitleModel(1, "Title1"),
    TitleModel(2, "Title2"),
    TitleModel(3, "Title3")
  ];

  static final contents = [
    ContentModel(1, 1, false, "Item1", 1),
    ContentModel(2, 1, false, "Item2", 2),
    ContentModel(3, 1, false, "Item3", 3),
    ContentModel(4, 1, false, "Item4", 4),
    ContentModel(5, 1, false, "Item5", 5),
  ];

  static final db = AppDatabase();

  @override
  void deleteContent(int contentId) {
    contents.removeWhere((element) => element.id == contentId);
  }

  @override
  void deleteTitle(int titleId) {
    db.deleteTitleModel(titleId);
  }

  @override
  Future<List<ContentModel>> getContentsByTitleId(int titleId) {
    return db.findContentModelsByTitleId(titleId);
  }

  @override
  Future<TitleModel> findTitle(int titleId) {
    return db.findTitleModel(titleId);
  }

  @override
  Future<List<TitleModel>> getAllTitles() {
    return db.getAllTitleModels();
  }

  @override
  Future<TitleModel> addTitle(String title) {
    return db.insertTitleModel(TitleModel(0, title));
  }

  @override
  void addContent(ContentModel contentModel) {
    db.insertContentModel(contentModel);
  }

  @override
  void updateContents(List<ContentModel> contents){
    contents = contents;
  }
}