import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

//api key de Pernas = 77335f53286ea3ce074ab21558a8fd05
//ejemplo para upcoming
//https://api.themoviedb.org/3/movie/upcoming?api_key=77335f53286ea3ce074ab21558a8fd05&language=en-US&page=1
final _apiKey = '77335f53286ea3ce074ab21558a8fd05';
final _baseUrl = "http://api.themoviedb.org/3/movie";

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<List<Movies>> getUpcomingMovies() async {
    final response = await _client
        .get("$_baseUrl/upcoming?api_key=$_apiKey&language=es-SP&page=1");
    //print(response.body.toString());
    List<Movies> myResults = [];
    if (response.statusCode == 200) {
      //print("Inside 200 status code");
      var jsonBody = json.decode(response.body);
      List jsonList = jsonBody['results'];
      //print(jsonList.length);

      for (int i = 0; i < jsonList.length; i++) {
        Movies _movies = Movies.fromMap(jsonList[i]);
        myResults.add(_movies);
      }

      return myResults;
    } else {
      print("Status code : ${response.statusCode}");
      throw Exception('Failed to load movies list');
    }
  }

  @override
  Future<List<Movies>> getPopularMovies() async {
    final response = await _client
        .get("$_baseUrl/popular?api_key=$_apiKey&language=es-SP&page=1");
    List<Movies> myPopularMovies = [];

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonPopularMovies = jsonBody['results'];

      for (int i = 0; i < jsonPopularMovies.length; i++) {
        Movies _movies = Movies.fromMap(jsonPopularMovies[i]);
        myPopularMovies.add(_movies);
      }

      return myPopularMovies;
    } else {
      throw Exception('Failed to load popular movies list');
    }
  }

  @override
  Future<List<Movies>> getTopRatedMovies() async {
    final response = await _client
        .get("$_baseUrl/top_rated?api_key=$_apiKey&language=es-SP&page=1");
    List<Movies> myTopRatedMovies = [];

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonPopularMovies = jsonBody['results'];

      for (int i = 0; i < jsonPopularMovies.length; i++) {
        Movies _movies = Movies.fromMap(jsonPopularMovies[i]);
        myTopRatedMovies.add(_movies);
      }
      return myTopRatedMovies;
    } else {
      throw Exception('Failed to load top rated movies list');
    }
  }

  /*@override
  Future<List<Genres>> getMovieGenres() async {
    final response =
        await _client.get("https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey&language=es-SP");

    List<Genres> movieGenres = [];

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonMovieGenres = jsonBody['genres'];

      for (int i = 0; i < jsonMovieGenres.length; i++) {
        Genres _genres = Genres.fromMap(jsonMovieGenres[i]);
        movieGenres.add(_genres);
      }
      return movieGenres;
    } else {
      throw Exception('Failed to load top rated movies list');
    }
  }*/
}
