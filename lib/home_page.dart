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
            physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(margin: EdgeInsets.only (top: 30, bottom: 20, left: 13, right: 13),
                    child: new Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90,), textAlign: TextAlign.center),
                  )
                ),
                Container(margin: EdgeInsets.only (top: 0, bottom: 20, left: 30, right: 13),
                  child: new Text('to...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90,), textAlign: TextAlign.left),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(image:
                    DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: new ExactAssetImage("images/Hack_the_North_Logo.png")
                    )
                  )
                ),
                Container(margin: EdgeInsets.only (top: 40, bottom: 100, left: 30, right: 13),
                  child: new Text("Going to work shouldn't scare you", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,), textAlign: TextAlign.right),
                )
              ]
          ),
        )
    );
  }
}