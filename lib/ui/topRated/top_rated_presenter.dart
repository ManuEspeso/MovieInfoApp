import 'package:MovieDb/repository/remote/RemoteRepository.dart';
import 'package:MovieDb/util/utils.dart';

class TopRatedPresenter {
  TopRatedProtocol _view;
  final RemoteRepository _remoteRepository;

  TopRatedPresenter(this._view, this._remoteRepository);

  List _listPopularMovies = [];

  init() async {
    _listPopularMovies = await _remoteRepository.getTopRatedMovies();
    _view.showTopRatedMovies(_listPopularMovies);
  }

  String getMovieGenres(List<int> genreIds) {
    return getGenreString(genreIds);
  }
}

abstract class TopRatedProtocol {
  showTopRatedMovies(List popularMovies);
}
