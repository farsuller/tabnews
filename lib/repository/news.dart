import 'dart:convert';
import 'package:tabnews/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:tabnews/utils/keys.dart';

class News {
  List<ArticleModel> newsData = [];
  Future<void> getTopNews() async {
    var response = await http.get(BASE_URL+"&apiKey="+API_KEY);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          newsData.add(articleModel);
        }
      });
    }
  }

  Future<void> getCategoryNews(String category) async {
    var response = await http.get(BASE_URL+"&category=$category"+"&apiKey="+API_KEY);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          newsData.add(articleModel);
        }
      });
    }
  }
}