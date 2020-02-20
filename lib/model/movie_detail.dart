class MovieDetail {
  String original_title;
  String status;
  int runtime;
  int budget;
  int revenue;
  String homepage;
  String imdb_id;

  MovieDetail(this.original_title, this.status, this.runtime, this.budget,
      this.revenue, this.homepage, this.imdb_id);

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    String original_title = map['original_title'] ?? "";
    String status = map['status'] ?? "";
    int runtime = map['runtime'];
    int budget = map['budget'];
    int revenue = map['revenue'];
    String homepage = map['homepage'] ?? "";
    String imdb_id = map['imdb_id'];

    return MovieDetail(
        original_title, status, runtime, budget, revenue, homepage, imdb_id);
  }
}
