import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_friend_flutter/bloc/content/content/content_bloc.dart';
import 'package:shopping_friend_flutter/bloc/content/title/content_title_bloc.dart';
import 'package:shopping_friend_flutter/repositories/database_repository.dart';
import 'package:shopping_friend_flutter/views/content/widgets/content_bottom_buttons.dart';
import 'package:shopping_friend_flutter/views/content/widgets/content_list_view.dart';
import 'package:shopping_friend_flutter/views/content/widgets/content_title.dart';

class ContentPage extends StatelessWidget {
  final int titleId;
  ContentPage(this.titleId);

  final _databaseRepository = DatabaseRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ContentBloc>(
          create: (context) => ContentBloc(_databaseRepository, titleId),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<ContentTitleBloc>(
          create: (context) => ContentTitleBloc(_databaseRepository, titleId),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: ContentTitle(),
        ),
        body: ContentListView(),
        bottomSheet: ContentBottomButtons(),
      ),
    );
  }
}
