import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabnews/views/article_screen.dart';
import 'package:tabnews/views/category_article_screen.dart';

class CategoryTile extends StatelessWidget{

  final imageUrl, categoryTitle;

  const CategoryTile({Key key, this.imageUrl, this.categoryTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryArticleScreen(
          category: categoryTitle.toLowerCase()
        ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
            width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26
              ),
              child: Text(categoryTitle, style: TextStyle(color: Colors.white, fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }

}