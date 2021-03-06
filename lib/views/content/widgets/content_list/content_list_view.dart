import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content/content_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/content_model/content_model.dart';
import 'package:shopping_friend_flutter/views/content/widgets/content_list/list_tile/content_list_tile.dart';

class ContentListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ContentBlocInterface contentBloc = Provider.of(context, listen: false);

    return StreamBuilder<List<ContentModel>>(
      initialData: [],
      stream: contentBloc.contents,
      builder: (content, snapshot){
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index){
            return ContentListTile(snapshot.data![index]);
          },
        );
      },
    );
  }
}