import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/repositories/database_repository.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_list_view.dart';

class TitlePage extends StatelessWidget {

  final String pageTitle;
  final _databaseRepository = DatabaseRepository();

  TitlePage(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    return Provider<TitleBloc>(
      create: (context) => TitleBloc(_databaseRepository),
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
