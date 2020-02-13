import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/repository/remote/HttpRemoteRepository.dart';
import 'package:movies_proyect/ui/detail/detail_screen.dart';
import 'package:movies_proyect/ui/upcoming/upcoming_presenter.dart';

class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen>
    implements UpcomingScreenProtocol {
  HttpRemoteRepository _httpRemote = HttpRemoteRepository(Client());

  UpcomingPresenter _presenter;
  List _upcomingList = [];

  @override
  void initState() {
    super.initState();
    _presenter = UpcomingPresenter(this, _httpRemote);
    _presenter.init();
  }

  @override
  addUpcomingMovies(List _myList) {
    setState(() {
      this._upcomingList = _myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listBuilder(),
      backgroundColor: Colors.black,
    );
  }

  Widget listBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext ctxt, int index) {
        return _buildListItem(_upcomingList[index], ctxt);
      },
      itemCount: _upcomingList.length,
    );
  }

  _buildListItem(Movies _movies, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(_movies)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            width: 150,
            height: 245,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w185${_movies.poster_path}'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_movies.title,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_movies.release_date),
                            ),
                            Icon(Icons.star),
                            Text(_movies.vote_average.toString())
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 100,
                      child: Text(
                        _movies.overview,
                        style: TextStyle(fontSize: 14.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    )
                  ],
                )
              ],
            )),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      ),
    );
  }
}
