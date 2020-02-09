import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/dependency_injector.dart';
import 'package:movies_proyect/ui/topRated/top_rated_presenter.dart';

class TopRatedScreen extends StatefulWidget {
  @override
  _TopRatedScreenState createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen>
    implements TopRatedProtocol {
  var listPrueba = [4, 5, 7, 9];
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
    this.listTopRatedMovies = popularMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            //onPressed: () => goToSearch(context),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff2b5876),
                        const Color(0xff4e4376),
                      ])),
                )),
            ListTile(
              title: Text("Favorites"),
              trailing: Icon(Icons.favorite),
              //onTap: () => goToFavorites(context),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Movies"),
              //selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              /*onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },*/
            ),
            ListTile(
              title: Text("TV Shows"),
              // selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv),
              /*onTap: () {
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },*/
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
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
                      //style: TextStyle(fontSize: 14.0),
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
                      presenter.getGenreString(movie.genre_ids),
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
    child: Card(
      child: Column(
        children: <Widget>[
          InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${movie.poster_path}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 215,
            ),
          ),
          movieElements(movie),
        ],
      ),
    ),
  );
}
