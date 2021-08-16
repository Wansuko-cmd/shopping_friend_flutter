import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/views/content/content_page.dart';

class TitleListTile extends StatelessWidget {
  final TitleModel title;

  TitleListTile(this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(title.id),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentPage(title.id),
          )
        );
      },
      child: ListTile(
        title: Text(title.name),
      ),
    );
  }
}
