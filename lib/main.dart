import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tabnews/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: SplashScreen(
          seconds: 3,
          // the widget to run after running your splashscreen for 1 sec
          navigateAfterSeconds: HomeScreen(),
          image: Image.asset('assets/tabnews.png'),
          backgroundColor: Colors.white,
          loaderColor: Colors.white,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 100.0,
      ),
    );
  }
}
