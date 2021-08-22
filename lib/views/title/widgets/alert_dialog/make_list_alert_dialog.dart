import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';
import 'package:shopping_friend_flutter/views/widgets/text_alert_dialog.dart';

class MakeListAlertDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return TextAlertDialog(
      title: "タイトル",
      hintText: "タイトル",
      onNegative: (formKey, value) => Navigator.pop(context),
      onPositive: (formKey, value)
        => formKey.currentState!.validate() ? Navigator.pop<String>(context, value) : null,
      validator: (value) => isBlank(value) ? '入力してください' : null,
    );
  }
}
