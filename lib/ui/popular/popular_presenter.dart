import 'package:MovieDb/repository/remote/RemoteRepository.dart';

class PopularPresenter {
  PopularProtocol _view;
  final RemoteRepository _remoteRepository;

  PopularPresenter(this._view, this._remoteRepository);

  List _listPopularMovies = [];

  init() async {
    _listPopularMovies = await _remoteRepository.getPopularMovies();
    _view.showPopularMovies(_listPopularMovies);
  }
}

abstract class PopularProtocol {
  showPopularMovies(List listPopularMovies);
}
