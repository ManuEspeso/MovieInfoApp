import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_proyect/model/cast.dart';
import 'package:movies_proyect/model/movie_detail.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/dependency_injector.dart';
import 'package:movies_proyect/ui/detail/about_section.dart';
import 'package:movies_proyect/ui/detail/cast_section.dart';
import 'package:movies_proyect/ui/detail/detail_presenter.dart';
import 'package:movies_proyect/ui/detail/similar_section.dart';
import 'package:movies_proyect/util/bottom_gradient.dart';
import 'package:movies_proyect/util/text_bubble.dart';
import 'package:movies_proyect/util/utils.dart';

class DetailScreen extends StatefulWidget {
  final Movies movie;

  DetailScreen(this.movie);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    implements DetailScreenProtocol {
  DetailPresenter presenter;
  MovieDetail _movieDetail;
  List<Cast> _actorList;
  List<Movies> _movieSimilar;

  @override
  void initState() {
    super.initState();
    presenter = DetailPresenter(this, Injector.instance.remoteRepository);
    presenter.init(widget.movie.id);
    presenter.getCastMovie(widget.movie.id);
    presenter.getSimilarMovies(widget.movie.id);
  }

  @override
  showMovieDetails(MovieDetail movieDetail) {
    setState(() {
      _movieDetail = movieDetail;
    });
  }

  @override
  showMovieCast(List<Cast> movieCast) {
    setState(() {
      _actorList = movieCast;
    });
  }

  @override
  showMovieSimilar(List<Movies> movieSimilar) {
    setState(() {
      _movieSimilar = movieSimilar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2C2B33),
        body: CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(),
            _buildContentSection(),
          ],
        ));
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 240.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "Movie-Tag-${widget.movie.id}",
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie.backdrop_path}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            BottomGradient(),
            _buildMetaSection()
          ],
        ),
      ),
    );
  }

  Widget _buildMetaSection() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                TextBubble(
                  widget.movie.release_date.toString(),
                  backgroundColor: Color(0xffF47663),
                ),
                Container(
                  width: 8.0,
                ),
                TextBubble(widget.movie.vote_average.toString(),
                    backgroundColor: Color(0xffF47663)),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(widget.movie.title,
                  style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 20.0)),
            ),
            Row(
              children: getGenresForIds(widget.movie.genre_ids)
                  .sublist(0, min(5, widget.movie.genre_ids.length))
                  .map((genre) => Row(
                        children: <Widget>[
                          TextBubble(genre),
                          Container(
                            width: 8.0,
                          )
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Container(
          decoration: BoxDecoration(color: const Color(0xff222128)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SYNOPSIS",
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  height: 8.0,
                ),
                Text(widget.movie.overview,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 12.0)),
                Container(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xFF2C2B33)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _actorList == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CastSection(_actorList)),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xFF222128)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _movieDetail == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : AboutSection(_movieDetail)),
        ),
        Container(
            decoration: BoxDecoration(color: Color(0xFF2C2B33)),
            child: _movieSimilar == null
                ? Container()
                : SimilarSection(_movieSimilar))
      ]),
    );
  }
}
