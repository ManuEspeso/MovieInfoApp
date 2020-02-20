import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/util/bottom_gradient.dart';
import 'package:movies_proyect/util/text_bubble.dart';
import 'package:movies_proyect/util/utils.dart';

class DetailScreen extends StatelessWidget {
  final Movies _movie;

  DetailScreen(this._movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2C2B33),
        body: CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(_movie),
            _buildContentSection(_movie),
          ],
        ));
  }

  Widget _buildAppBar(Movies movie) {
    return SliverAppBar(
      expandedHeight: 240.0,
      pinned: true,
      /*actions: <Widget>[
        ScopedModelDescendant<AppModel>(
            builder: (context, child, AppModel model) => IconButton(
                icon: Icon(model.isItemFavorite(widget._mediaItem)
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () => model.toggleFavorites(widget._mediaItem)))
      ],*/
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "Movie-Tag-${_movie.id}",
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${_movie.backdrop_path}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            BottomGradient(),
            _buildMetaSection(_movie)
          ],
        ),
      ),
    );
  }

  Widget _buildMetaSection(Movies mediaItem) {
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
                  mediaItem.backdrop_path.toString(),
                  backgroundColor: Color(0xffF47663),
                ),
                Container(
                  width: 8.0,
                ),
                TextBubble(_movie.vote_average.toString(),
                    backgroundColor: Color(0xffF47663)),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(mediaItem.title,
                  style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 20.0)),
            ),
            Row(
              children: getGenresForIds(mediaItem.genre_ids)
                  .sublist(0, min(5, mediaItem.genre_ids.length))
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

  Widget _buildContentSection(Movies media) {
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
                Text(media.overview,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 12.0)),
                Container(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        /*Container(
          decoration: BoxDecoration(color: Color(0xFF2C2B33)  ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _actorList == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CastSection(_actorList)),
        ),*/
        /*Container(
          decoration: BoxDecoration(color: Color(0xFF222128)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _mediaDetails == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MetaSection(_mediaDetails)),
        ),*/
        /*(widget._mediaItem.type == MediaType.show)
            ? Container(
                decoration: BoxDecoration(color: primary),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _seasonList == null
                        ? Container()
                        : SeasonSection(widget._mediaItem, _seasonList)),
              )
            : Container(),*/
        /*Container(
            decoration: BoxDecoration(
                color: (widget._mediaItem.type == MediaType.movie
                    ? primary
                    : primaryDark)),
            child: _similarMedia == null
                ? Container()
                : SimilarSection(_similarMedia)
        )*/
      ]),
    );
  }
}
