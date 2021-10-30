import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/common/screen/loading_screen.dart';

import '../cubit/articles_cubit.dart';
import 'widgets/article_tile.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loaded) {
          final articles = state.article;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemCount: articles.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleTile(article: article);
                }),
          );
        } else if (state.loadStatus == LoadStatus.loading) {
          return LoadingScreen();
        } else if (state.loadStatus == LoadStatus.error) {
          return Center(
            child: Text('An Error Occured'),
          );
        } else {
          return Center(
            child: Text('Initial'),
          );
        }
      },
    );
  }
}
