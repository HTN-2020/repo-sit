import 'package:flutter/material.dart';

class WELCOMEScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to SitDown',
        home: Scaffold(
          backgroundColor: Color(0xffd6eaff),
          body:
          ListView(
              children: <Widget>[
                Container(margin: EdgeInsets.only (top: 80, bottom: 20, left: 13, right: 13),
                  child: new Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90,), textAlign: TextAlign.center),
                ),
                Container(margin: EdgeInsets.only (top: 0, bottom: 20, left: 30, right: 13),
                  child: new Text('to...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90,), textAlign: TextAlign.left),
                ),
                Container(margin: EdgeInsets.only (top: 200, bottom: 100, left: 30, right: 13),
                  child: new Text("Going to work shouldn't scare you", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,), textAlign: TextAlign.right),
                )
              ]
          ),
        )
    );
  }
}