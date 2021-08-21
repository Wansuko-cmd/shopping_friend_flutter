import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content/content_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';

class ContentListTile extends StatelessWidget{

  final ContentModel _contentModel;
  ContentListTile(this._contentModel);

  @override
  Widget build(BuildContext context) {

    ContentBlocInterface contentBloc = Provider.of(context, listen: false);

    return InkWell(
      key: ValueKey(_contentModel.id),
      onTap: (){},
      child: Card(
        elevation: 8,
        color: _contentModel.isChecked ? Colors.lightBlueAccent : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          leading: Checkbox(
            onChanged: (value) => contentBloc.changeCheck(_contentModel.id, value!),
            value: _contentModel.isChecked,
          ),
          title: TextFormField(
            initialValue: _contentModel.item,
            onChanged: (value) => contentBloc.changeText(_contentModel.id, value),
              // _contentModel.id.toString()
          ),
        ),
      ),
    );
  }
}