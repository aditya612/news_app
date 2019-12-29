import 'package:flutter/material.dart';
import 'package:news_app/screen/home_page.dart';
// import 'package:news_app/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
