import 'dart:async';

import 'package:shopping_friend_flutter/models/content_model/content_model.dart';

abstract class ContentBlocInterface{

  Stream<List<ContentModel>> get contents;

  Future<ContentModel> insertContentModel();

  void changeCheck(int id, bool isChecked);

  void changeText(int id, String item);

  void dispose();
}