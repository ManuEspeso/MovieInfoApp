import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRatedScreen extends StatefulWidget {
  @override
  _TopRatedScreenState createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  var listPrueba = [4, 5, 7, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            //onPressed: () => goToSearch(context),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    const Color(0xff2b5876),
                    const Color(0xff4e4376),
                  ])),
                )),
            ListTile(
              title: Text("Favorites"),
              trailing: Icon(Icons.favorite),
              //onTap: () => goToFavorites(context),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Movies"),
              //selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              /*onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },*/
            ),
            ListTile(
              title: Text("TV Shows"),
              // selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv),
              /*onTap: () {
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },*/
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listPrueba.length,
          itemBuilder: (context, index) {
            return _buildCard();
          }),
      backgroundColor: Colors.black,
    );
  }

  Widget movieElements() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "titulo",
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      "muchos generos",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "5.7",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Container(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.star,
                      size: 16.0,
                    )
                  ],
                ),
                Container(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "2001",
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Container(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.date_range,
                        size: 16.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard() => SizedBox(
        height: 285,
        child: Card(
          child: Column(
            children: <Widget>[
              InkResponse(
                enableFeedback: true,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185/5BwqwxMEjeFtdknRV792Svo0K1v.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              movieElements(),
            ],
          ),
        ),
      );

}
