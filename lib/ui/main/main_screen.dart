import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_proyect/ui/popular/popular_screen.dart';
import 'package:movies_proyect/ui/search/search_screen.dart';
import 'package:movies_proyect/ui/topRated/top_rated_screen.dart';
import 'package:movies_proyect/ui/upcoming/upcoming_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [PopularScreen(), UpcomingScreen(), TopRatedScreen()];
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MovieDB"),
          backgroundColor: Colors.black,
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
                title: Text("Search"),
                //selected: mediaType == MediaType.movie,
                trailing: Icon(Icons.search),
                onTap: () {
                  Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              ),
              ListTile(
                title: Text("TV Shows"),
                // selected: mediaType == MediaType.show,
                trailing: Icon(Icons.live_tv),
                onTap: () {
               
              },
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
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.black,
            selectedIndex: _selectedIndex,
            showElevation: true,
            // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
                  _selectedIndex = index;
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.local_play),
                title: Text('Popular'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.alarm),
                  title: Text('Upcoming'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.whatshot),
                  title: Text('Top Rated'),
                  activeColor: Colors.pink),
            ]));
  }
}
