import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/title/title_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';
import 'package:shopping_friend_flutter/views/title/widgets/title_list/list_tile/title_list_tile.dart';

class TitleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TitleBlocInterface titleBloc = Provider.of(context, listen: false);

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
