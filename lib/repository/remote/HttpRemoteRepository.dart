import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_proyect/model/cast.dart';
import 'package:movies_proyect/model/movie_detail.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

final _apiKey = '77335f53286ea3ce074ab21558a8fd05';
final _baseUrl = "http://api.themoviedb.org/3/movie";

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<List<Movies>> getUpcomingMovies() async {
    final response = await _client
        .get("$_baseUrl/upcoming?api_key=$_apiKey&language=es-SP&page=1");

    List<Movies> myResults = [];
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonList = jsonBody['results'];

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

  @override
  Future<MovieDetail> getMovieDetails(int movieId) async {
    final response = await _client.get("$_baseUrl/$movieId?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return MovieDetail.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve Movie Detail');
    }
  }

  @override
  Future<List<Cast>> getMovieCast(int movieID) async {
    final response =
        await _client.get("$_baseUrl/$movieID/credits?api_key=$_apiKey");

    List<Cast> castMovie = [];

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonCastMovie = jsonBody['cast'];

      for (int i = 0; i < jsonCastMovie.length; i++) {
        Cast _cast = Cast.fromJson(jsonCastMovie[i]);
        castMovie.add(_cast);
      }
      return castMovie;
    } else {
      throw Exception('Failed to retrieve Movie Detail');
    }
  }

  @override
  Future<List<Movies>> getMovieSimilar(int movieID) async {
    final response = await _client.get(
        "$_baseUrl/$movieID/similar?api_key=$_apiKey&language=es-SP&page=1");
    List<Movies> mySimilarMovies = [];

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonSimilarMovies = jsonBody['results'];

      for (int i = 0; i < jsonSimilarMovies.length; i++) {
        Movies _movies = Movies.fromMap(jsonSimilarMovies[i]);
        mySimilarMovies.add(_movies);
      }
      return mySimilarMovies;
    } else {
      throw Exception('Failed to load top rated movies list');
    }
  }
}
