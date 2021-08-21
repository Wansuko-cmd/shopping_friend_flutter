import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_list_tile.dart';

class TitleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TitleBloc titleBloc = Provider.of<TitleBloc>(context, listen: false);

    return StreamBuilder<List<TitleModel>>(
      initialData: [],
      stream: titleBloc.titles,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return TitleListTile(snapshot.data![index]);
          },
        );
      },
    );
  }
}
