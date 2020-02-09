import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

class TopRatedPresenter {
  TopRatedProtocol _view;
  final RemoteRepository _remoteRepository;

  TopRatedPresenter(this._view, this._remoteRepository);

  List _listPopularMovies = [];
  var mapName = Map();

  init() async {
    _listPopularMovies = await _remoteRepository.getTopRatedMovies();
    _view.showTopRatedMovies(_listPopularMovies);
  }

  List<String> getGenresForIds(List<int> genreIds) =>
      genreIds.map((id) => _genreMap[id]).toList();

  String getGenreString(List<int> genreIds) {
    StringBuffer buffer = StringBuffer();
    buffer.writeAll(getGenresForIds(genreIds), ", ");
    return buffer.toString();
  }

  getMovieGenres(List<int> genreIds) async {
    /*_listPopularMovies = await _remoteRepository.getMovieGenres();
    print(_listPopularMovies[0]);
    getTio(_listPopularMovies[0]);*/
    StringBuffer buffer = StringBuffer();
    buffer.writeAll(genreIds.map((id) => _genreMap[id]).toList(), ", ");
    print(buffer.toString());
    return buffer.toString();
  }

  /*getTio(Genres genre) {
    //print(genre.name);

    List<String> letters = [genre.name];
    List<int> numbers = [genre.id];


    mapName[genre.id] = genre.name;
    //print(mapName);

    Map<int, String> map = Map.fromIterables(numbers, letters);
   // print(map);
  }*/

  Map<int, String> _genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    10762: 'Kids',
    10759: 'Action & Adventure',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
    10763: '',
    10764: 'Reality',
    10765: 'Sci-Fi & Fantasy',
    10766: 'Soap',
    10767: 'Talk',
    10768: 'War & Politics',
  };
}

abstract class TopRatedProtocol {
  showTopRatedMovies(List popularMovies);
}
