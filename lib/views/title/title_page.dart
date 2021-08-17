import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/repositories/database_repository.dart';
import 'package:shopping_friend_flutter/views/title/widgets/make_list_alert_dialog.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final title = await showDialog(
                context: context,
                builder: (context) => MakeListAlertDialog()
            );
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(title.toString()),
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
