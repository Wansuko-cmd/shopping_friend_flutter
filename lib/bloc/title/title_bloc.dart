import 'dart:async';

import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class TitleBloc{

  final DatabaseRepositoryInterface _databaseRepository;

  final _titlesController = StreamController<List<TitleModel>>();

  Stream<List<TitleModel>> get titles => _titlesController.stream;

  TitleBloc(this._databaseRepository){
    getTitles();
  }

  void getTitles() async{
    List<TitleModel> titles = await _databaseRepository.getAllTitles();

    _titlesController.sink.add(titles);
  }

  Future<int> addTitle(String title) async{
    int titleId = await _databaseRepository.addTitle(title);
    return titleId;
  }

  void dispose(){
    _titlesController.close();
  }
}