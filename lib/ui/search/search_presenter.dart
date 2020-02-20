import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

class SearchPresenter {
  SearchedMoviesProtocol _view;
  final RemoteRepository _remoteRepository;

  SearchPresenter(this._view, this._remoteRepository);

  List _listPopularMovies = [];

  init(String movie) async {
    _listPopularMovies = await _remoteRepository.getSearchedMovie(movie);
    _view.showSearchedMovies(_listPopularMovies);
  }
}

abstract class SearchedMoviesProtocol {
  showSearchedMovies(List searched);
}
