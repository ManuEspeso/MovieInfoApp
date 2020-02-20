import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_proyect/model/movie_detail.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/HttpRemoteRepository.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

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
    test('Should return MOVIESDETAIL when request ', () async {
      when(_client.get(
              'http://api.themoviedb.org/3/movie/41342?api_key=77335f53286ea3ce074ab21558a8fd05'))
          .thenAnswer((_) async {
        return Response(
            '''
      {
    "adult": false,
    "backdrop_path": "/zNYbiNjYaeK8EDGFjXUJL7E54Bv.jpg",
    "belongs_to_collection": null,
    "budget": 0,
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 80,
            "name": "Crime"
        },
        {
            "id": 18,
            "name": "Drama"
        }
    ],
    "homepage": "http://www.baselinethemovie.com",
    "id": 41342,
    "imdb_id": "tt1390397",
    "original_language": "en",
    "original_title": "Baseline",
    "overview": "The Baseline is the centre of the East London grime club scene and the queue regularly stretches around the block. Danny works on the door - breaking up fights and managing drunk kids. However, when he rescues Terry, the club owner and local gang leader, from a hitman, Danny is suddenly plunged deep into an underworld he had tried so hard to avoid. Danny is promoted to manager, but only on the condition that he turns a blind eye to the shady goings on both on and off the dance-floor. Danny and his girlfriend Jessica dream of setting up their own club, but Danny is forced to make the ultimate sacrifice when he has to choose between loyalty, morality and his own dreams of escape",
    "popularity": 2.89,
    "poster_path": "/gR2UN3Bu8c4RYnp7RwCC6nKwMnh.jpg",
    "production_companies": [
        {
            "id": 25318,
            "logo_path": null,
            "name": "Fourth Culture Films",
            "origin_country": ""
        },
        {
            "id": 25316,
            "logo_path": null,
            "name": "Dangerous Productions",
            "origin_country": ""
        },
        {
            "id": 25315,
            "logo_path": null,
            "name": "FineLight Films",
            "origin_country": ""
        },
        {
            "id": 21532,
            "logo_path": null,
            "name": "Motion Picture House",
            "origin_country": ""
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "GB",
            "name": "United Kingdom"
        }
    ],
    "release_date": "2010-06-02",
    "revenue": 0,
    "runtime": 96,
    "spoken_languages": [
        {
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "Every friendship has its price",
    "title": "Baseline",
    "video": false,
    "vote_average": 5.3,
    "vote_count": 6
}
       ''',
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
            });
      });

      MovieDetail moviesDetail = await repository.getMovieDetails(41342);

      //expect(movies.length, 1);
      //expect(moviesDetail.adult, false);
      expect(moviesDetail.homepage, 'http://www.baselinethemovie.com');
      //expect(moviesDetail.backdrop_path, "/zNYbiNjYaeK8EDGFjXUJL7E54Bv.jpg");
      //expect(moviesDetail.id, 41342);
    });

    test('Should return Searched movies', () async {
      when(_client.get(
              'http://api.themoviedb.org/3/movie/upcoming?api_key=77335f53286ea3ce074ab21558a8fd05&language=es-SP&page=1'))
          .thenAnswer((_) async {
        return Response(
            '''
      {
    "page": 1,
    "total_results": 41,
    "total_pages": 3,
    "results": [
        {
            "popularity": 34.362,
            "vote_count": 17431,
            "video": false,
            "poster_path": "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
            "id": 680,
            "adult": false,
            "backdrop_path": "/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg",
            "original_language": "en",
            "original_title": "Pulp Fiction",
            "genre_ids": [
                80,
                53
            ],
            "title": "Pulp Fiction",
            "vote_average": 8.5,
            "overview": "A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.",
            "release_date": "1994-09-10"
        }
    ]
}
       ''',
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
            });
      });

      List<Movies> movies = await repository.getSearchedMovie("pulp");

      expect(movies.length, 1);
      expect(movies[0].popularity, 34.362);
      expect(movies[0].vote_count, 17431);
    });
  });
}
