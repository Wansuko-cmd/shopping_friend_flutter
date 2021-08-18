import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content_bloc.dart';

class ContentBottomButtons extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    ContentBloc contentBloc = Provider.of(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () => contentBloc.addContents(),
              child: Icon(Icons.add)
          ),
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: () => contentBloc.deleteCheckedContents(),
              child: Icon(Icons.delete)
          ),
        ),
      ],
    );
  }
}