import 'package:MovieDb/repository/remote/RemoteRepository.dart';

class UpcomingPresenter {
  UpcomingScreenProtocol _view;
  final RemoteRepository _remoteRepository;

  UpcomingPresenter(this._view, this._remoteRepository);

  List _listItem = [];

  init() async {
    _listItem = await _remoteRepository.getUpcomingMovies();
    _view.addUpcomingMovies(_listItem);
  }
}

abstract class UpcomingScreenProtocol {
  addUpcomingMovies(List _myList) {}
}
