import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tabnews/models/article_model.dart';
import 'package:tabnews/repository/news.dart';
import 'package:tabnews/widgets/article_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryArticleScreen extends StatefulWidget{

  final String category;

  const CategoryArticleScreen({Key key, this.category}) : super(key: key);
  @override
  _CategoryArticleScreenState createState() => _CategoryArticleScreenState();
}

class _CategoryArticleScreenState extends State<CategoryArticleScreen> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    News newsCategory = News();
    await newsCategory.getCategoryNews(widget.category);
    articles = newsCategory.newsData;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            Text("Tab"),
            Text("News", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: _loading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ):Container(
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: articles.length,
            itemBuilder: (context, index){
              return ArticleTile(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title,
                description: articles[index].description,
                url: articles[index].url,
              );
            }),
      )
    );
  }
}