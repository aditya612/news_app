import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  const NewsDetails({Key key, this.news}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
      body: _itemBuilder(widget.news),
    );
  }

  Widget _itemBuilder(News news) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: height * .3,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(news.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: height * .6,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      news.headline,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 16),
                      child: Text(
                        news.articleBody,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
