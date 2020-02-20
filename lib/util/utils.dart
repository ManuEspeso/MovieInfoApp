Map<int, String> genreMap = {
  37: 'Western',
  10752: 'Bélica',
  53: 'Suspense',
  10770: 'Película de TV',
  878: 'Ciencia ficción',
  10749: 'Romance',
  9648: 'Misterio',
  10402: 'Música',
  27: 'Terror',
  36: 'Historia',
  14: 'Fantasy',
  36: 'History',
  14: 'Fantasía',
  10751: 'Familia',
  18: 'Drama',
  99: 'Documental',
  80: 'Crimen',
  35: 'Comedia',
  16: 'Animación',
  12: 'Aventura',
  28: 'Acción',
};

List<String> getGenresForIds(List<int> genreIds) =>
    genreIds.map((id) => genreMap[id]).toList();

String getGenreString(List<int> genreIds) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(getGenresForIds(genreIds), ", ");
  return buffer.toString();
}

String formatRuntime(int runtime) {
  int hours = runtime ~/ 60;
  int minutes = runtime % 60;

  return '$hours\h $minutes\m';
}

String getImdbUrl(String imdbId) => 'http://www.imdb.com/title/$imdbId';

String concatListToString(List<dynamic> data, String mapKey) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(data.map<String>((map) => map[mapKey]).toList(), ", ");
  return buffer.toString();
}
