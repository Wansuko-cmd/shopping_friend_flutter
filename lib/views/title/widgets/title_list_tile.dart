import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';

class TitleListTile extends StatelessWidget {
  final TitleModel title;

  TitleListTile(this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(title.id),
      onTap: (){},
      child: ListTile(
        title: Text(title.name),
      ),
    );
  }
}
