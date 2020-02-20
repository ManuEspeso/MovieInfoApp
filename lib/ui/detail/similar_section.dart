import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/ui/detail/detail_screen.dart';

class SimilarSection extends StatelessWidget {
  final List<Movies> _similarMovies;

  SimilarSection(this._similarMovies);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Similar",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          height: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            scrollDirection: Axis.horizontal,
            children: _similarMovies
                .map((Movies movie) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(movie)));
                      },
                      child: FadeInImage.assetNetwork(
                        image:
                            'https://image.tmdb.org/t/p/w300${movie.poster_path}',
                        placeholder: 'assets/placeholder.jpg',
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
