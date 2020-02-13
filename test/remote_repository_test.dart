import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/HttpRemoteRepository.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';
import 'package:matcher/matcher.dart';

class clientMock extends Mock implements Client {}

clientMock _client = clientMock();
RemoteRepository repository = HttpRemoteRepository(_client);

void main() {
  group('getMovies', () {
    test('Should return MOVIES when request ', () async {
      when(_client.get(
              'http://api.themoviedb.org/3/movie/upcoming?api_key=77335f53286ea3ce074ab21558a8fd05&language=es-SP&page=1'))
          .thenAnswer((_) async {
        return Response(
            '''
      {
    "results": [
        {
            "popularity": 325.832,
            "vote_count": 3472,
            "video": false,
            "poster_path": "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
            "id": 496243,
            "adult": false,
            "backdrop_path": "/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg",
            "original_language": "ko",
            "original_title": "기생충",
            "genre_ids": [
                35,
                18,
                53
            ],
            "title": "Parasite",
            "vote_average": 8.6,
            "overview": "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
            "release_date": "2019-05-30"
        }
      ]
    }
       ''',
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
            });
      });

      List<Movies> movies = await repository.getUpcomingMovies();

      expect(movies.length, 1);
      expect(movies[0].popularity, 325.832);
      expect(movies[0].vote_count, 3472);
      expect(movies[0].poster_path, "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg");
      expect(movies[0].id, 496243);
    });
  });
}
