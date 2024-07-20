import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListView({
    super.key, required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                return Padding(
                  padding:  const EdgeInsets.only(bottom: 22),
                  child: NewsTile(articleModel: articles[index]),
                );
              },
            ),
          );
    // ListView.builder(
    //   // physics: BouncingScrollPhysics(),
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.only(bottom: 22),
    //       // padding: EdgeInsets.all(16),
    //       child: NewsTile(),
    //     );
    //   },
    // );
  }
}
