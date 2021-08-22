import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckAlertDialog extends StatelessWidget{

  final String? title;
  final String? content;
  final VoidCallback? onNegative;
  final VoidCallback? onPositive;

  CheckAlertDialog({
    this.title,
    this.content,
    this.onNegative,
    this.onPositive,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
            child: Text('Cancel'),
            onPressed: onNegative
        ),
        TextButton(
            child: Text('OK'),
            onPressed: onPositive
        )
      ],
    );
  }
}