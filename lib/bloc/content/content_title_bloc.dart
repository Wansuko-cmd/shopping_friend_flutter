import 'dart:async';

import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class ContentTitleBloc{

  final DatabaseRepositoryInterface _databaseRepository;

  final _titleController = StreamController<TitleModel>();

  Stream<TitleModel> get title => _titleController.stream;

  ContentTitleBloc(this._databaseRepository, int titleId){
    getTitle(titleId);
  }

  void getTitle(int titleId) async{
    TitleModel title = await _databaseRepository.findTitle(titleId);
    _titleController.sink.add(title);
  }

  void dispose(){
    _titleController.close();
  }
}