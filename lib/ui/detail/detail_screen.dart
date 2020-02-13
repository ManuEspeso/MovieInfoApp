import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movies.dart';

class DetailScreen extends StatelessWidget {
  final Movies _movie;

  DetailScreen(this._movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movie.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Title: " + _movie.title),
        ),
      ),
    );
  }
}
