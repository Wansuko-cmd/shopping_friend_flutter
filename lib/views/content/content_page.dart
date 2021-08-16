import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget{

  final int id;

  ContentPage(this.id);

  @override
  Widget build(BuildContext context) {

    final title = "Contents";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("$id"),
    );
  }
}