import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget{

  final imageNewsUrl;

  const ArticleScreen({Key key, this.imageNewsUrl}) : super(key: key);
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
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
            Text("News", style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:[
            WebView(
              initialUrl: widget.imageNewsUrl,
              onPageStarted: (finish){
                setState(() {
                  _loading = false;
                });
                },
              onWebViewCreated: ((WebViewController webviewController){
                _completer.complete(webviewController);
              }),
            ),
            Visibility(
              visible: _loading,
                child: Center(child: CircularProgressIndicator(),))
          ]
        ),
      ),
    );
  }
}