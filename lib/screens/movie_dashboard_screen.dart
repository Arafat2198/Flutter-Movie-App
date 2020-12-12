import 'package:flutter/material.dart';
import 'dart:async';
import '../widget/side_bar.dart';
import '../services/Movie_Dashboard_Screen_Service.dart';
import '../widget/horizontal_list_item.dart';
import '../widget/vertical_list_item.dart';

class MovieDashboardScreen extends StatefulWidget {
  @override
  _MovieDashboardScreenState createState() => _MovieDashboardScreenState();
}

class _MovieDashboardScreenState extends State<MovieDashboardScreen> {
  // ignore: must_call_super
  void initState() {
    fetch();
  }

  final up = new UpcomingMovies();

  var upcoming = [];

  var top = new TopMovies();

  var topmovies = [];

  var pop = new PopularMovies();

  var popular = [];

  Future fetch() async {
    upcoming = await up.getData();
    print(upcoming[0].title);

    if (upcoming.length == 0) {
      // print("Upcoming Movie API Extraction Unsuccessfull");
    } else {
      // print(' Upcoming Movie API Extraction Succeess');
    }

    topmovies = await top.getData();
    print(topmovies[0].title);

    if (topmovies.length == 0) {
      // print("Top Movie API Extraction Unsuccessfull");
    } else {
      // print(' Top Movie Movie API Extraction Succeess');
    }

    popular = await pop.getData();
    print(popular[0].title);

    if (popular.length == 0) {
      // print("Popular Movie API Extraction Unsuccessfull");
    } else {
      // print(' Popular Movie API Extraction Succeess');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Pop-Corn fLiX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://c4.wallpaperflare.com/wallpaper/779/691/639/movies-film-reel-technology-projector-8mm-wallpaper-preview.jpg"),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              CustomListTile(Icons.person, 'Profile', () => {}),
              CustomListTile(Icons.tv, 'TV Shows', () => {}),
              CustomListTile(Icons.theaters_outlined, 'Movies', () => {}),
              CustomListTile(Icons.bookmark_border, 'My List ', () => {}),
              CustomListTile(Icons.logout, 'Log Out ', () => {}),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Upcoming',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (ctx, i) => HorizontalListItem(
                      i, upcoming, upcoming[i].title, 'movie'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Best of 2020',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 1000,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: popular.length,
                  itemBuilder: (ctx, i) =>
                      VerticalListItem(i, popular, popular[i].title, 'movie'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Top Rated Movies',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topmovies.length,
                  itemBuilder: (ctx, i) => HorizontalListItem(
                      i, topmovies, topmovies[i].title, 'movie'),
                ),
              ),
            ],
          ),
        ));
  }
}
