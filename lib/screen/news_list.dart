import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/screen/news_detail.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 5),

          title: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(news[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              news[index].headline,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  backgroundColor: Colors.black26,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.bottomCenter,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return NewsDetails(
                    news: news[index],
                  );
                },
              ),
            );

            print('tap');
          },

          // color: Colors.amber,
        );
      },
    );
  }
}
