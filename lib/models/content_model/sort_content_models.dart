import 'package:shopping_friend_flutter/models/content_model/content_model.dart';

mixin SortContentModels{

  List<ContentModel> sortContentModels(List<ContentModel> contents){
    contents.sort((a, b) {

      // if(a.isChecked != b.isChecked){
      //   if(a.isChecked) return 1;
      //   else return -1;
      // }

      return a.number - b.number;
    });

    return contents;
  }
}