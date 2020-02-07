import 'package:flutter/material.dart';
import 'package:movies_proyect/model/result.dart';
import 'package:movies_proyect/repository/HttpRemoteRepository.dart';
import 'package:movies_proyect/ui/upcoming/upcoming_presenter.dart';

class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen>
    implements UpcomingScreenProtocol {
  HttpRemoteRepository _httpRemote = HttpRemoteRepository();
  Result _resultss;
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
      appBar: AppBar(
        title: Center(child: Text('Upcoming Movies')),
      ),
      body: listBuilder(),
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

  _buildListItem(Result _result, BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          width: 100,
          height: 200,
          child: Row(
            children: <Widget>[
              Image.network(
                  'https://image.tmdb.org/t/p/w185${_result.poster_path}'),
              Text(_result.title),
            ],
          )),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
    );
  }
}
