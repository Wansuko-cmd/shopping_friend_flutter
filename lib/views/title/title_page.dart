import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_list_view.dart';

class TitlePage extends StatelessWidget {
  final String pageTitle;

  TitlePage(this.pageTitle);

  final titles = [TitleModel(1, "Title1"), TitleModel(2, "Title2")];

  @override
  Widget build(BuildContext context) {
    return Provider<TitleBloc>(
      create: (context) => TitleBloc(titles),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
        ),
        body: TitleListView(),
      ),
    );
  }
}
