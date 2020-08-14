import 'package:MovieDb/model/cast.dart';
import 'package:MovieDb/model/movie_detail.dart';
import 'package:MovieDb/model/movies.dart';
import 'package:MovieDb/repository/remote/RemoteRepository.dart';

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
