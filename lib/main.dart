import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  // getGeneralNews();
  // NewsService().getGeneralNews();
  runApp( const NewsApp());
}

// final dio = Dio();

// void getGeneralNews() async {
//   final response = await dio.get(
//       'https://newsapi.org/v2/everything?q=bitcoin&apiKey=0769df66b333404eb80d6bc103ef7c6c');
//   print(response);
// }

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
