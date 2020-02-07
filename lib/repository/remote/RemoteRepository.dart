
import 'package:movies_proyect/model/movies.dart';

abstract class RemoteRepository {
  //pantalla de upcoming
  Future <List<Movies>> getUpcomingMovies();
  Future <List<Movies>> getPopularMovies();
}