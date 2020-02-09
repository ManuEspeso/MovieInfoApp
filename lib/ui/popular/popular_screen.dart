import 'package:flutter/material.dart';
import 'package:movies_proyect/repository/dependency_injector.dart';
import 'package:movies_proyect/ui/popular/popular_presenter.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
    implements PopularProtocol {
  PopularPresenter presenter;
  var listPopularMovies = [];

  @override
  void initState() {
    super.initState();
    presenter = PopularPresenter(this, Injector.instance.remoteRepository);
    presenter.init();
  }

  @override
  showPopularMovies(List listPopularMovies) {
    setState(() {
      this.listPopularMovies = listPopularMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMoviesListElement(listPopularMovies),
      backgroundColor: Colors.black,
    );
  }

  Widget buildMoviesListElement(List movies) {
    return GridView.count(
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      childAspectRatio: (35 / 47),
      crossAxisCount: 2,
      children: List.generate(movies.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(
              left: 3.0, top: 3.0, right: 3.0, bottom: 0.0),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: InkResponse(
              splashColor: Colors.red,
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movies[index].poster_path}',
                fit: BoxFit.cover,
              ),
              //onTap: () => goToMoviesDetailPage(snapshot.data, index),
            ),
          ),
        );
      }),
    );
  }
}
