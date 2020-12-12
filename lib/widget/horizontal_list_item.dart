import 'package:flutter/material.dart';
import '../screens/movie_details_screen.dart';
import '../screens/tv_details_screen.dart';

// import '../model/movie.dart';

// ignore: must_be_immutable
class HorizontalListItem extends StatelessWidget {
  final urlheader = 'https://image.tmdb.org/t/p/w500';
  final int index;
  final name;
  String url;
  String type;
  List item = [];
  HorizontalListItem(this.index, this.item, this.name, this.type) {
    url = urlheader + item[index].posterPath;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160,
      child: InkWell(
        onTap: type == 'movie'
            ? () {
                Navigator.of(context).pushNamed(
                  MovieDetailsScreen.routeName,
                  arguments: {
                    'id': item[index].id.toString(),
                    'title': name.toString(),
                    'imageUrl': url.toString(),
                    'description': item[index].overview.toString(),
                    'rating': item[index].voteAverage.toString(),
                    'year': '2020',
                    'duration': item[index].voteCount.toString(),
                  },
                );
              }
            : () {
                Navigator.of(context).pushNamed(
                  TvDetailsScreen.routeName,
                  arguments: {
                    'id': item[index].id.toString(),
                    'title': name.toString(),
                    'imageUrl': url.toString(),
                    'description': item[index].overview.toString(),
                    'rating': item[index].voteAverage.toString(),
                    'year': '2020',
                    'duration': item[index].voteCount.toString(),
                  },
                );
              },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: item[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(url),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
