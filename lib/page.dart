import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final _controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return item();
      },
    );
  }
}

Widget item() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            image: NetworkImage('https://flutter.dev/images/favicon.png'),
          ),
        ),
        Text('Porro sapiente consequatur fugit.'),
        Text('''Rerum aperiam sed cum consequatur.Omnis placeat tempore 
          quibusdam consequatur harum.Totam neque aut quia ad sed et 
          veritatis et omnis.Praesentium et voluptas.''')
      ],
    ),
  );
}
