import 'dart:async';

import 'package:shopping_friend_flutter/bloc/title/title_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class TitleBloc implements TitleBlocInterface{

  ///流す値
  final _titlesController = StreamController<List<TitleModel>>();

  @override
  Stream<List<TitleModel>> get titles => _titlesController.stream;



  ///リポジトリ
  final DatabaseRepositoryInterface _databaseRepository;


  TitleBloc(this._databaseRepository){
    _getAllTitleModels();
  }


  ///DBから値を取得する操作
  void _getAllTitleModels() async{
    List<TitleModel> titles = await _databaseRepository.getAllTitleModels();

    _titlesController.sink.add(titles);
  }



  @override
  Future<TitleModel> insertTitleModel(String name) async{

    final titleModel = await _databaseRepository
        .insertTitleModel(TitleModel.forInsert(name: name));

    _getAllTitleModels();

    return titleModel;
  }

  @override
  void deleteTitleModel(int id) async{

    await _databaseRepository.deleteTitleModel(id);

    _getAllTitleModels();
  }

  @override
  void dispose(){
    _titlesController.close();
  }
}