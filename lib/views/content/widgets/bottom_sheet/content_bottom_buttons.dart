import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content/content_bloc_interface.dart';
import 'package:shopping_friend_flutter/views/widgets/check_alert_dialog.dart';

class ContentBottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContentBlocInterface contentBloc = Provider.of(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () => contentBloc.insertContentModel(),
              child: Icon(Icons.add)),
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => CheckAlertDialog(
                    title: '確認',
                    content: 'チェックのついている項目を削除してよろしいですか？',
                    onPositive: () {
                      contentBloc.deleteCheckedContentModels();
                      Navigator.pop(context);
                    },
                    onNegative: () => Navigator.pop(context),
                  ),
                );
              },
              child: Icon(Icons.delete)),
        ),
      ],
    );
  }
}
