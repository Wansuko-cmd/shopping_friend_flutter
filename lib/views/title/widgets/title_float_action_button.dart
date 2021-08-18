import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/views/content/content_page.dart';

import 'make_list_alert_dialog.dart';

class TitleFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TitleBloc titleBloc = Provider.of(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {
        final title = await showDialog(
            context: context, builder: (context) => MakeListAlertDialog());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(title.toString()),
        ));
        if (title != null) {
          titleBloc.addTitle(title).then((titleId) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentPage(titleId),
                ));
          });
        }
      },
      child: Icon(Icons.add),
    );
  }
}