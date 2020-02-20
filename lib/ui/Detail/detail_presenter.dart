import 'package:movies_proyect/model/cast.dart';
import 'package:movies_proyect/model/movie_detail.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

class DetailPresenter {
  DetailScreenProtocol _view;
  final RemoteRepository _remoteRepository;

  DetailPresenter(this._view, this._remoteRepository);

  init(int movieID) async {
    _view.showMovieDetails(await _remoteRepository.getMovieDetails(movieID));
  }

  getCastMovie(int movieID) async {
    _view.showMovieCast(await _remoteRepository.getMovieCast(movieID));
  }

  getSimilarMovies(int movieID) async {
    _view.showMovieSimilar(await _remoteRepository.getMovieSimilar(movieID));
  }
}

abstract class DetailScreenProtocol {
  showMovieDetails(MovieDetail movieDetail);

  showMovieCast(List<Cast> movieCast);

  showMovieSimilar(List<Movies> movieSimilar);
}
