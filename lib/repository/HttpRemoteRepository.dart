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
  Future<List<Result>> getUpcomingMovies()  async {
     final response = await client.get("$_baseUrl/upcoming?api_key=$_apiKey&language=es-SP&page=1");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print("Inside 200 status code");
      
      
    } else {
      print("Status code : ${response.statusCode}");
       throw Exception('Failed to load movies list');
    } 
  }

}