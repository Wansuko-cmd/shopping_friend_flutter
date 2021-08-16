import 'dart:async';

import 'package:shopping_friend_flutter/models/title_model.dart';

class TitleBloc{

  final _titlesController = StreamController<List<TitleModel>>();

  Stream<List<TitleModel>> get titles => _titlesController.stream;

  TitleBloc(List<TitleModel> titles){
    setTitles(titles);
  }

  void setTitles(List<TitleModel> titles){
    _titlesController.sink.add(titles);
  }

  void dispose(){
    _titlesController.close();
  }
}