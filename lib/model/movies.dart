class Movies {
  //final double popularity;
  final int vote_count;
  final String poster_path;
  final int id;
  final String backdrop_path;
  final String original_language;
  final String original_title;
  List<int> genre_ids = [];
  final String title;
  final double vote_average;
  final String overview;
  final String release_date;

  Movies(
      //this.popularity,
      this.vote_count,
      this.poster_path,
      this.id,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.title,
      this.vote_average,
      this.overview,
      this.release_date);

  factory Movies.fromMap(Map<String, dynamic> map) {
    //double popularity = map['popularity'];
    int voteCount = map['vote_count'];
    String posterPath = map['poster_path'] ?? "";
    int id = map['id'].toInt();
    String backdropPath = map['backdrop_path'] ?? "";
    String originalLanguage = map['original_language'];
    String originalTitle = map['original_title'];
    List<int> genreIds = map['genre_ids'].cast<int>();
    String title = map['title'];
    double voteAverage = map['vote_average'].toDouble();
    String overview = map['overview'];
    String releaseDate = map['release_date'];

    return Movies(
        //popularity,
        voteCount,
        posterPath,
        id,
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

class MovieDetail {
  bool _adult;
  String _backdropPath;
  List<Genres> _genres;
  String _homepage;
  int _id;

  MovieDetail({
    bool adult,
    String backdropPath,
    List<Genres> genres,
    String homepage,
    int id,
  }) {
    this._adult = adult;
    this._backdropPath = backdropPath;
    this._genres = genres;
    this._homepage = homepage;
    this._id = id;
  }

  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;

  List<Genres> get genres => _genres;
  set genres(List<Genres> genres) => _genres = genres;
  String get homepage => _homepage;
  set homepage(String homepage) => _homepage = homepage;
  int get id => _id;
  set id(int id) => _id = id;

  MovieDetail.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      _genres = new List<Genres>();
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this._homepage;
    data['id'] = this._id;
    return data;
  }
}

class Genres {
  int _id;
  String _name;

  Genres({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Genres.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}


