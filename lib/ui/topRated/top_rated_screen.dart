import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/dependency_injector.dart';
import 'package:movies_proyect/ui/detail/detail_screen.dart';
import 'package:movies_proyect/ui/topRated/top_rated_presenter.dart';

class TopRatedScreen extends StatefulWidget {
  @override
  _TopRatedScreenState createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen>
    implements TopRatedProtocol {
  TopRatedPresenter presenter;
  var listTopRatedMovies = [];

  @override
  void initState() {
    super.initState();
    presenter = TopRatedPresenter(this, Injector.instance.remoteRepository);
    presenter.init();
  }

  @override
  showTopRatedMovies(List popularMovies) {
    setState(() {
      this.listTopRatedMovies = popularMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listTopRatedMovies.length,
          itemBuilder: (context, index) {
            return _buildCard(listTopRatedMovies[index]);
          }),
      backgroundColor: Colors.black,
    );
  }

  Widget movieElements(Movies movie) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      presenter.getMovieGenres(movie.genre_ids),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      movie.vote_average.toString(),
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Container(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 16.0,
                    )
                  ],
                ),
                Container(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        movie.release_date,
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Container(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.date_range,
                        size: 16.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Movies movie) => SizedBox(
        height: 285,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(movie)));
          },
          child: Card(
            child: Column(
              children: <Widget>[
                InkResponse(
                  enableFeedback: true,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                    fit: BoxFit.cover,
                    height: 215,
                  ),
                ),
                movieElements(movie),
              ],
            ),
          ),
        ),
      );
}
