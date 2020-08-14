import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:MovieDb/model/movies.dart';
import 'package:MovieDb/repository/dependency_injector.dart';
import 'package:MovieDb/ui/Detail/detail_screen.dart';
import 'package:MovieDb/ui/search/search_presenter.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    implements SearchedMoviesProtocol {
  final myController = TextEditingController();

  SearchPresenter presenter;
  var listSearchedMovies = [];
  String myMovie;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    presenter = SearchPresenter(this, Injector.instance.remoteRepository);
    myController.addListener(_printLatestValue);
  }

  @override
  showSearchedMovies(List searched) {
    setState(() {
      this.listSearchedMovies = searched;
    });
  }

  Future _printLatestValue() async {
    //print("Second text field: ${myController.text}");
    await presenter.init(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Movies'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingSearchBar.builder(
              controller: myController,
              itemBuilder: (BuildContext context, int index) {
                return buildMoviesList(listSearchedMovies[index]);
              },
              itemCount: listSearchedMovies.length),
        ));
  }

  Widget buildMoviesList(Movies movie) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailScreen(movie)));
        },
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(movie.title),
          subtitle: Text(movie.release_date),
          leading: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.poster_path}'),
        ));
  }
}
