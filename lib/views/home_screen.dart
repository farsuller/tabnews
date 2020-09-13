import 'package:flutter/material.dart';
import 'package:tabnews/models/article_model.dart';
import 'package:tabnews/models/category_model.dart';
import 'package:tabnews/repository/news.dart';
import 'package:tabnews/utils/data.dart';
import 'package:tabnews/widgets/article_tile.dart';
import 'package:tabnews/widgets/category_tile.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  News news = News();

  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews()async{
    await news.getTopNews();
    articles = news.newsData;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tab"),
            Text("News", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: _loading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ): Container(
        child: Column(
          children: [
            //Categories
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemCount:categories.length,
                  itemBuilder: (context,index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryTitle: categories[index].categoryTitle,
                    );
                  }),
            ),

            //TopArticles
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                    itemBuilder: (context, index){
                    return ArticleTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                    );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}