import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



typedef TextAlertDialogCallback = void Function(GlobalKey<FormState> formKey, String value);



class TextAlertDialog extends StatelessWidget{

  final String? title;
  final String? hintText;
  final TextAlertDialogCallback? onNegative;
  final TextAlertDialogCallback? onPositive;
  final FormFieldValidator<String>? validator;

  TextAlertDialog({
    this.title,
    this.hintText,
    this.onNegative,
    this.onPositive,
    this.validator
  });


  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(hintText: hintText),
          autofocus: true,
          validator: validator,
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => onNegative != null ? onNegative!(_formKey, _controller.text) : null
        ),
        TextButton(
            child: Text('OK'),
            onPressed: () => onPositive != null ? onPositive!(_formKey, _controller.text) : null
        )
      ],
    );
  }
}