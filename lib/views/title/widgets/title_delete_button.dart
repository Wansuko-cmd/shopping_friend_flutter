import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleDeleteButton extends StatelessWidget{

  final VoidCallback onPressed;
  TitleDeleteButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Icon(Icons.delete),
    );
  }
}