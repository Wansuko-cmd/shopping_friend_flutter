import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget{

  final String title;

  TitlePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("TITLE"),
    );
  }
}