import 'package:MovieDb/model/cast.dart';
import 'package:MovieDb/model/movie_detail.dart';
import 'package:MovieDb/model/movies.dart';

abstract class RemoteRepository {
  Future<List<Movies>> getUpcomingMovies();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();

  Future<MovieDetail> getMovieDetails(int movieId);

  Future<List<Movies>> getSearchedMovie(String movie);

  Future<List<Cast>> getMovieCast(int movieID);

  Future<List<Movies>> getMovieSimilar(int movieID);
}
