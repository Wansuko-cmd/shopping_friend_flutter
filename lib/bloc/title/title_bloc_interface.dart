import 'dart:async';

import 'package:shopping_friend_flutter/models/title_model/title_model.dart';

abstract class TitleBlocInterface{

  Stream<List<TitleModel>> get titles;

  Future<TitleModel> insertTitleModel(String name);

  void deleteTitleModel(int id);

  void dispose();
}