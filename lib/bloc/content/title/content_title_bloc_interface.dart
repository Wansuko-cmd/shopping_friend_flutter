import 'package:shopping_friend_flutter/models/title_model.dart';

abstract class ContentTitleBlocInterface{

  Stream<TitleModel> get title;

  void findTitleModel(int titleId);

  void dispose();
}