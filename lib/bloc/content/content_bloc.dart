import 'dart:async';

import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class ContentBloc{

  final DatabaseRepositoryInterface _databaseRepository;

  final _contentsController = StreamController<List<ContentModel>>();

  final int titleId;

  Stream<List<ContentModel>> get contents => _contentsController.stream;

  ContentBloc(this._databaseRepository, this.titleId){
    getContents();
  }

  void getContents() async{
    List<ContentModel> contents = await _databaseRepository.getContentsByTitleId(titleId);

    _contentsController.sink.add(contents);
  }

  Future<TitleModel> getTitle() async{
    TitleModel title = await _databaseRepository.findTitle(titleId);
    return title;
  }

  void dispose(){
    _contentsController.close();
  }
}