import 'package:flutter/material.dart';
import 'package:movies_proyect/repository/HttpRemoteRepository.dart';

class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
 HttpRemoteRepository _httpRemote = HttpRemoteRepository();
@override
  void initState() {
    super.initState();
   _httpRemote.getUpcomingMovies();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpcomingView"),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
