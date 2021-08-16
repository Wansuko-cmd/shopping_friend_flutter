import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/model/title_model.dart';

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
          body: Consumer<TitleBloc>(
            builder: (context, value, child) {
              return TitleListView(value.titles);
            },
          )),
    );
  }
}

class TitleListView extends StatelessWidget {
  final Stream<List<TitleModel>> _stream;

  TitleListView(this._stream);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TitleModel>>(
      initialData: [],
      stream: _stream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data![index].name),
            );
          },
        );
      },
    );
  }
}
