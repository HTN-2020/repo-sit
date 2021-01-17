import 'package:flutter/material.dart';
import 'home_page.dart';
import 'main.dart';
import 'placeholder_widget.dart';
import 'CovidForm.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    CovidScreening(),
  WelcomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('SitDown'),
      //),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), title: Text('Book')),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
