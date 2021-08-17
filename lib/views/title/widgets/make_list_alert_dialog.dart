import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeListAlertDialog extends StatelessWidget{
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("タイトル"),
      content: TextFormField(
        controller: titleController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          hintText: "タイトル"
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.pop<String>(context, titleController.text),
        )
      ],
    );
  }
}