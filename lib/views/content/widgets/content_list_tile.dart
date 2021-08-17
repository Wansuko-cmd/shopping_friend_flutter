import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_friend_flutter/models/content_model.dart';

class ContentListTile extends StatelessWidget{

  final ContentModel _contentModel;
  ContentListTile(this._contentModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(_contentModel.item),);
  }
}