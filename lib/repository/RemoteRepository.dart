
import 'package:movies_proyect/model/result.dart';

abstract class RemoteRepository {
  //pantalla de upcoming
  Future <List<Result>> getUpcomingMovies();
}