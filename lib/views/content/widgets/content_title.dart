import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content_title_bloc.dart';
import 'package:shopping_friend_flutter/models/title_model.dart';

class ContentTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ContentTitleBloc contentTitleBloc = Provider.of<ContentTitleBloc>(context, listen: false);

    return StreamBuilder<TitleModel>(
      stream: contentTitleBloc.title,
      builder: (context, snapshot){
        return Text(snapshot.data?.name ?? "");
      },
    );
  }
}