import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc_interface.dart';
import 'package:shopping_friend_flutter/views/content/content_page.dart';

import '../alert_dialog/make_list_alert_dialog.dart';

class TitleFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TitleBlocInterface titleBloc = Provider.of(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {

        //タイトル名の取得
        final name = await showDialog(
            context: context, builder: (context) => MakeListAlertDialog());

        //タイトルが空でなければ
        if (isNotBlank(name)) {

          //DBに保存
          titleBloc.insertTitleModel(name).then((titleModel) {

            //詳細ページに飛ぶ
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentPage(titleModel.id),
                ));
          });
        }
      },
      child: Icon(Icons.add),
    );
  }
}
