import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tabnews/views/article_screen.dart';

class ArticleTile extends StatelessWidget{

  final imageUrl, title, description, url;

  const ArticleTile({Key key,@required this.imageUrl, @required this.title,@required  this.description,@required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ArticleScreen(imageNewsUrl: url,))
        );
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Container(
                    child: CachedNetworkImage(imageUrl:imageUrl))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(description),
            )
          ],
        ),
      ),
    );
  }
}