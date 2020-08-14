import 'package:flutter/material.dart';
import 'package:MovieDb/repository/dependency_injector.dart';
import 'package:MovieDb/ui/detail/detail_screen.dart';
import 'package:MovieDb/ui/popular/popular_presenter.dart';

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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(movies[index])));
              },
              splashColor: Colors.red,
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${movies[index].poster_path}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }
}
