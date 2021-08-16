import 'package:flutter/material.dart';
import 'package:shopping_friend_flutter/views/title/title_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final title = "Shopping Friend";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Friend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TitlePage(title),
    );
  }
}
