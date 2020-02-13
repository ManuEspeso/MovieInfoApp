import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

class DetailPresenter {
  DetailScreenProtocol _view;
  final RemoteRepository _remoteRepository;

  DetailPresenter(this._view, this._remoteRepository);
  int _movieId;

  MovieDetail _movieDetail;

  init() async {
    _movieDetail = await _remoteRepository.getMovieDetails(_movieId);
    _view.showMovieDetails(_movieDetail);
  }
}

abstract class DetailScreenProtocol {
  showMovieDetails(MovieDetail) {}
}
