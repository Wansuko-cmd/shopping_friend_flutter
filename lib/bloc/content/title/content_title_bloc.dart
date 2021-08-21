import 'dart:async';

import 'package:shopping_friend_flutter/bloc/content/title/content_title_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class ContentTitleBloc implements ContentTitleBlocInterface{

  ///流す値
  final _titleController = StreamController<TitleModel>();

  @override
  Stream<TitleModel> get title => _titleController.stream;




  ///リポジトリ
  final DatabaseRepositoryInterface _databaseRepository;

  ContentTitleBloc(this._databaseRepository, int titleId){
    findTitleModel(titleId);
  }

  @override
  void findTitleModel(int titleId) async{

    TitleModel title = await _databaseRepository.findTitleModel(titleId);
    _titleController.sink.add(title);
  }

  @override
  void dispose(){
    _titleController.close();
  }
}