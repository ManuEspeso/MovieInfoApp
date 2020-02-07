class Movies {
  final double popularity;
  final int vote_count;
  final bool video;
  final String poster_path;
  final int id;
  final bool adult;
  final String backdrop_path;
  final String original_language;
  final String original_title;
  List<int> genre_ids = [];
  final String title;
  final double vote_average;
  final String overview;
  final String release_date;

  Movies(
      this.popularity,
      this.vote_count,
      this.video,
      this.poster_path,
      this.id,
      this.adult,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.title,
      this.vote_average,
      this.overview,
      this.release_date);

  factory Movies.fromMap(Map<String, dynamic> map) {
    double popularity = map['popularity'];
    int voteCount = map['vote_count'];
    bool video = map['video'];
    String posterPath = map['poster_path'] ?? "";
    int id = map['id'].toInt();
    bool adult = map['adult'];
    String backdropPath = map['backdrop_path'] ?? "";
    String originalLanguage = map['original_language'];
    String originalTitle = map['original_title'];
    List<int> genreIds = map['genre_ids'].cast<int>();
    String title = map['title'];
    double voteAverage = map['vote_average'].toDouble();
    String overview = map['overview'];
    String releaseDate = map['release_date'];

    return Movies(
        popularity,
        voteCount,
        video,
        posterPath,
        id,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        genreIds,
        title,
        voteAverage,
        overview,
        releaseDate);
  }
}
