import 'dart:async';

import 'package:shopping_friend_flutter/models/content_model.dart';
import 'package:shopping_friend_flutter/repositories/database_repository_interface.dart';

class ContentBloc{

  final DatabaseRepositoryInterface _databaseRepository;

  final _contentsController = StreamController<List<ContentModel>>();

  final int titleId;
  
  List<ContentModel> _contents = [];

  Stream<List<ContentModel>> get contents => _contentsController.stream;

  ContentBloc(this._databaseRepository, this.titleId){
    getContents();
  }

  void getContents() async{
    _contents = await _databaseRepository.getContentsByTitleId(titleId);

    _contents.sort((a, b) => a.number - b.number);

    _contentsController.sink.add(_contents);
  }

  void addContents() async{
    final int id = _contents.length + 1;
    ContentModel contentModel = ContentModel(id, titleId, false, "", id);

    _contents.add(contentModel);

    _databaseRepository.addContent(contentModel);

    _contentsController.sink.add(_contents);
  }
  
  void changeCheck(int contentId, bool isChecked) async{
    _contents[_contents.indexWhere((element) => element.id == contentId)].isChecked = isChecked;

    // _contents.sort((a, b) {
    //
    //   if(a.isChecked != b.isChecked){
    //     if(a.isChecked) return 1;
    //     else return -1;
    //   }
    //
    //   return a.number - b.number;
    // });

    _contentsController.sink.add(_contents);
  }

  void deleteCheckedContents() async {

  }

  void dispose(){
    _contentsController.close();
  }
}