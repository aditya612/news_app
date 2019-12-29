import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/screen/news_list.dart';

import 'package:http/http.dart' as http;

// A function that converts a response body into a List<Photo>.
List<News> parseNews(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

Future<List<News>> fetchNews() async {
  final response =
      await http.get('https://newsscrapy.herokuapp.com/api/all_news');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    // Use the compute function to run parsePhotos in a separate isolate.

    return compute(parseNews, response.body);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<News>> news;

  bool _loading = false;

  bool isLoading() {
    setState(() {
      _loading = !_loading;
    });
    return _loading;
  }

  @override
  void initState() {
    super.initState();
    news = fetchNews();
    isLoading();
  }

  // @override
  // void setState(fn) {
  //   news = fetchNews();
  //   isLoading();
  //   super.setState(fn);
  // }

  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () {
                // setState(() {
                //   news = fetchNews();
                //   isLoading();
                //   print(_loading);
                // });
              }),
        ],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<News>>(
            future: news,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? NewsList(news: snapshot.data)
                  : Center(child: spinkit);
            },
          ),
          // child: Page(),
        ),
      ),
    );
  }
}
