import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class MakeListAlertDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("タイトル"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: titleController,
          decoration: const InputDecoration(hintText: "タイトル"),
          autofocus: true,
          validator: (value) {
            if (isBlank(value)) return '入力してください';
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            if(_formKey.currentState!.validate()) Navigator.pop<String>(context, titleController.text);
          }
        )
      ],
    );
  }
}
