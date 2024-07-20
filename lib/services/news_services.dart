import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final dio = Dio();
  // final Dio dio;
  // NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {
    // return await Future.delayed(
    //   const Duration(seconds: 10),
    //   () async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=0769df66b333404eb80d6bc103ef7c6c&country=us&category=$category');
      // var response = await dio.get(
      //     'https://newsapi.org/v2/top-headlines?apiKey=0769df66b333404eb80d6bc103ef7c6c&country=eg&category=general');
      // List jsonData = response.data;
      Map<String, dynamic> jsonData = response.data;
      // var jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      // List<Map<String, dynamic>> mylist =
      //     jsonData['articles'] as List<Map<String, dynamic>>;
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        // ArticleModel articleModel = ArticleModel(
        //   image: article['urlToImage'],
        //   title: article['title'],
        //   subTitle: article['description'],
        //   // source: Source(
        //   //   id: article['source']['id'],
        //   //   name: article['source']['name'],
        //   // ),
        // );
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      // print(articlesList);
      return articlesList;
    } catch (e) {
      // TODO
      return [];
    }
    //   },
    // );
  }
  // void getGeneralNews() async {
  //   final response = await dio.get(
  //       'https://newsapi.org/v2/everything?q=bitcoin&apiKey=0769df66b333404eb80d6bc103ef7c6c');
  //   print(response);
  // }

  // void getSportsNews() async {
  //   final response = await dio.get(
  //       'https://newsapi.org/v2/everything?q=bitcoin&apiKey=0769df66b333404eb80d6bc103ef7c6c');
  //   print(response);
  // }
}
