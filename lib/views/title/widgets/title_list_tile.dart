import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/views/content/content_page.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_delete_button.dart';

class TitleListTile extends StatelessWidget {
  final TitleModel _title;

  TitleListTile(this._title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(_title.id),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentPage(_title.id),
          )
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          title: Text(_title.name),
          trailing: TitleDeleteButton(
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
