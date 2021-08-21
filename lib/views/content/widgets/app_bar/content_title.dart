import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/title/content_title_bloc_interface.dart';
import 'package:shopping_friend_flutter/models/title_model/title_model.dart';

class ContentTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ContentTitleBlocInterface contentTitleBloc = Provider.of(context, listen: false);

    return StreamBuilder<TitleModel>(
      stream: contentTitleBloc.title,
      builder: (context, snapshot){
        return Text(snapshot.data?.name ?? "");
      },
    );
  }
}