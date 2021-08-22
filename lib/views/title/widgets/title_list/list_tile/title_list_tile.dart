import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:shopping_friend_flutter/views/content/content_page.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_list/list_tile/title_delete_button.dart';
import 'package:shopping_friend_flutter/views/widgets/check_alert_dialog.dart';

class TitleListTile extends StatelessWidget {
  final TitleModel _title;

  TitleListTile(this._title);

  @override
  Widget build(BuildContext context) {
    TitleBlocInterface titleBloc = Provider.of(context, listen: false);

    return InkWell(
      key: ValueKey(_title.id),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContentPage(_title.id),
            ));
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          title: Text(_title.name),
          trailing: TitleDeleteButton(onPressed: () async{
            await showDialog(
                context: context,
                builder: (context) => CheckAlertDialog(
                  title: '確認',
                  content: '${_title.name}を削除してよろしいですか？',
                  onPositive: () {
                    titleBloc.deleteTitleModel(_title.id);
                    Navigator.pop(context);
                  },
                  onNegative: () => Navigator.pop(context),
                ),
            );
            // titleBloc.deleteTitleModel(_title.id);
          }),
        ),
      ),
    );
  }
}
