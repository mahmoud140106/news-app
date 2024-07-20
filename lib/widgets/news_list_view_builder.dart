import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleModel> articles = [];
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getTopHeadLines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('oops there was an error , try again later'),
          );
        } else {
          // return const SliverToBoxAdapter(
          //   child: Center(
          //       child: CircularProgressIndicator(
          //     backgroundColor: Colors.black,
          //     strokeCap: StrokeCap.round,
          //     color: Colors.orange,
          //   )),
          // );
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              // strokeCap: StrokeCap.round,
              color: Colors.orange,
            )),
          );
        }
      },
    );
    // turn it again to statelessssssssssss
    // isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //             child: CircularProgressIndicator(
    //           backgroundColor: Colors.black,
    //           strokeCap: StrokeCap.round,
    //           color: Colors.orange,
    //         )),
    //       )
    //     : articles.isNotEmpty
    //         ? NewsListView(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Text('oops there was an error , try again later'),
    //           );
  }
}
