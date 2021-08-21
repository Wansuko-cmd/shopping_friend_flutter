import 'dart:async';

import 'package:shopping_friend_flutter/models/content_model/sort_content_models.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

import 'content_bloc_interface.dart';

class ContentBloc with SortContentModels implements ContentBlocInterface{

  ///流す値
  final _contentsController = StreamController<List<ContentModel>>();

  @override
  Stream<List<ContentModel>> get contents => _contentsController.stream;


  ///流す値を管理する部分
  List<ContentModel> _contents = [];

  ///関連するタイトル
  final int titleId;


  ///リポジトリ
  final DatabaseRepositoryInterface _databaseRepository;

  ContentBloc(this._databaseRepository, this.titleId){
    _getContentModels();
  }


  ///DBから値を取得する操作
  void _getContentModels() async{
    _contents = await _databaseRepository.findContentModelsByTitleId(titleId);

    sortContentModels(_contents);

    _contentsController.sink.add(_contents);
  }



  @override
  Future<ContentModel> insertContentModel() async{

    final number = _contents.length;

    ContentModel contentModel = await _databaseRepository
        .insertContentModel(ContentModel.forInsert(titleId: titleId, number: number));

    _contents.add(contentModel);

    _contentsController.sink.add(_contents);

    return contentModel;
  }

  @override
  void changeCheck(int contentId, bool isChecked) async{
    _contents[_contents.indexWhere((element) => element.id == contentId)].isChecked = isChecked;

    sortContentModels(_contents);

    _contentsController.sink.add(_contents);
  }

  @override
  void changeText(int contentId, String item){
    _contents[_contents.indexWhere((element) => element.id == contentId)].item= item;

    _contentsController.sink.add(_contents);
  }

  @override
  void deleteCheckedContentModels(){
    List<ContentModel> contents = _contents.where((element) => element.isChecked).toList();

    _databaseRepository.deleteContentModels(contents);

    _contents.removeWhere((element) => element.isChecked);

    _contentsController.sink.add(_contents);
  }

  @override
  void dispose(){
    _databaseRepository.updateContentModels(_contents);
    _contentsController.close();
  }
}