class Result {
  double _popularity;
  int _vote_count;
  bool _video;
  String _poster_path;
  int _id;
  bool _adult;
  String _backdrop_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _title;
  double _vote_average;
  String _overview;
  String _release_date;

  Result(
      this._popularity,
      this._vote_count,
      this._video,
      this._poster_path,
      this._id,
      this._adult,
      this._backdrop_path,
      this._original_language,
      this._original_title,
      this._genre_ids,
      this._title,
      this._vote_average,
      this._overview,
      this._release_date);
}
