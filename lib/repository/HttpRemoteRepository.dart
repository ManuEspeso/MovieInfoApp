import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_proyect/model/result.dart';
import 'package:movies_proyect/repository/RemoteRepository.dart';

//api key de Pernas = 77335f53286ea3ce074ab21558a8fd05
//ejemplo para upcoming
//https://api.themoviedb.org/3/movie/upcoming?api_key=77335f53286ea3ce074ab21558a8fd05&language=en-US&page=1

class HttpRemoteRepository implements RemoteRepository {
  http.Client client = http.Client();
  final _apiKey = '77335f53286ea3ce074ab21558a8fd05';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  @override
  Future<List<Result>> getUpcomingMovies() async {
    final response = await client
        .get("$_baseUrl/upcoming?api_key=$_apiKey&language=es-SP&page=1");
    //print(response.body.toString());
    List<Result> myResults = [];
    if (response.statusCode == 200) {
      //print("Inside 200 status code");
      var jsonBody = json.decode(response.body);
      List jsonList = jsonBody['results'];
      //print(jsonList.length);

      for (int i = 0; i < jsonList.length; i++) {
        double popularity = jsonList[i]['popularity'];
        int voteCount = jsonList[i]['vote_count'];
        bool video = jsonList[i]['video'];
        String posterPath = jsonList[i]['poster_path'] ?? "";
        int id = jsonList[i]['id'].toInt();
        bool adult = jsonList[i]['adult'];
        String backdropPath = jsonList[i]['backdrop_path'] ?? "";
        String originalLanguage = jsonList[i]['original_language'];
        String originalTitle = jsonList[i]['original_title'];
        List<int> genreIds = jsonList[i]['genre_ids'].cast<int>();
        String title = jsonList[i]['title'];
        double voteAverage = jsonList[i]['vote_average'].toDouble();
        String overview = jsonList[i]['overview'];
        String releaseDate = jsonList[i]['release_date'];

        Result _results = Result(
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
        myResults.add(_results);
       //print(myResults);
      }
      return myResults;

    } else {
      print("Status code : ${response.statusCode}");
      throw Exception('Failed to load movies list');
    }
  }
}
