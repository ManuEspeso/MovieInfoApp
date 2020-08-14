import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MovieDb/ui/popular/popular_screen.dart';
import 'package:MovieDb/ui/search/search_screen.dart';
import 'package:MovieDb/ui/topRated/top_rated_screen.dart';
import 'package:MovieDb/ui/upcoming/upcoming_screen.dart';

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
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  ListTile(
                    title: Text(
                      "MovieDB",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800),
                    ),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/app_logo.png'),
                      ),
                    ),
                  ),
                  Divider(
                    height: 35.0,
                  ),
                  ListTile(
                    title: Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                  ),
                  Divider(
                    height: 5.0,
                  ),
                  ListTile(
                    title: Text(
                      "Close",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Divider(
                    height: 5.0,
                  ),
                  ListTile(
                    title: Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.question_answer,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
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
