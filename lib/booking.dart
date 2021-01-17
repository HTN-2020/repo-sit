import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htn_app/Confirmation.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Confirmation.dart';

class Booking extends StatefulWidget {
  final String title;

  Booking({Key key, this.title}) : super(key: key);

  @override
  _MyFloorState createState() => _MyFloorState();
}

class _MyFloorState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Select a floor',
                style: GoogleFonts.getFont('Source Sans Pro'))),
        body: ListView.builder(//
            itemCount: 2, // change to match database
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                _MyBookingPage(index: index)));
                  },
                  child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Card(
                        child: Center(
                            child: Text(
                          "Floor ${index + 1}",
                          style: GoogleFonts.getFont('Source Sans Pro'),
                          textScaleFactor: 2.5,
                        )),
                      )));
            }));
  }
}

class _MyBookingPage extends StatefulWidget {
  int index;

  _MyBookingPage({Key key, this.title, this.index}) : super(key: key);

  final String title;

  @override
  _MyBookingState createState() => _MyBookingState(index);
}

// This widget is the root of your application.
class _MyBookingState extends State<_MyBookingPage> {
  int index;

  // floor layout
  List<List<List<int>>> grids = [
    // CHANGE TO DATABASE
    [
      [1, 0, 0, 0, 2],
      [0, 1, 0, 2, 0],
      [0, 0, 2, 0, 0],
      [0, 2, 0, 1, 0],
      [2, 0, 0, 0, 1]
    ],
    [
      [1, 0, 0, 0, 2],
      [1, 1, 0, 2, 0],
      [1, 0, 2, 0, 0],
      [1, 2, 0, 1, 0],
      [1, 0, 0, 0, 1]
    ]
  ];

  List<List<int>> grid;

  int gridSize = 25;

  //colours for grid elements
  List colors = [Colors.white, Colors.green, Colors.black38];

  _MyBookingState(index) {
    grid = grids[index];
    this.index = index;
  }

  Widget setupGrid() {
    return GridView.count(
      // Create a grid with grid.length columns. If you change the scrollDirection to
      // horizontal, this produces grid.length rows.
      crossAxisCount: grid.length,
      mainAxisSpacing: 0,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(gridSize, (i) {
        return RaisedButton(
            color: colors[grid[i ~/ grid.length][i % grid.length]],
            child: Container(
                decoration: BoxDecoration(
                    image: (grid[i ~/ grid.length][i % grid.length] == 1)
                        ? DecorationImage(
                            image: new ExactAssetImage('images/table.png'),
                    )
                        : null)),
            onPressed: () {
              if (grid[i ~/ grid.length][i % grid.length] == 1) {
                // if the seat is available
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _MySelectedPage(
                            data: [index, i ~/ grid.length, i % grid.length])));
              }
            });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Select a table',
                style: GoogleFonts.getFont('Source Sans Pro'))),
        body: Container(margin: EdgeInsets.all(20.0), child: setupGrid()));
  }
} // _MyBookingState Class

class _MySelectedPage extends StatefulWidget {
  List data;

  _MySelectedPage({Key key, this.title, this.data}) : super(key: key);

  final String title;

  @override
  _MySelectedPageState createState() => _MySelectedPageState(this.data);
}

class _MySelectedPageState extends State<_MySelectedPage> {
  List data;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  DateTime d1 = DateTime.now();
  DateTime d2 = new DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 1);

  final myController = TextEditingController();

  _MySelectedPageState(List d) {
    this.data = d;
  }

  Future<Null> _selectDate(BuildContext context, DateTime d, int c) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null)
      setState(() {
        _selectedDate = picked;
        if (c == 1) {
          d1 = picked;
          _selectTime(context, d1, c);
        } else {
          d2 = picked;
          _selectTime(context, d2, c);
        }
      });
  }

  Future<Null> _selectTime(BuildContext context, DateTime d, int c) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _selectedDate = new DateTime(_selectedDate.year, _selectedDate.month,
            _selectedDate.day, _selectedTime.hour, _selectedTime.minute);
        if (c == 1) {
          d1 = _selectedDate;
        } else {
          d2 = _selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Set up your booking",
                style: GoogleFonts.getFont('Source Sans Pro'))),
        body: Container(
            //color: Color(0xffd6eaff),
            child: Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Card(
                        child: TextFormField(
                      // Name field
                      controller: myController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What do people call you?',
                        labelText: 'Name *',
                      ),
                    )),

                    //space
                    SizedBox(height: 40, width: double.infinity),

                    // DateTime fields
                    SizedBox(
                        height: 300,
                        child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                  color: Color(0xffadd6ff),
                                  child: InkWell(
                                      onTap: () => _selectDate(context, d1, 1),
                                      child: Text(
                                          new DateFormat.yMMMd().format(d1) +
                                              "\n" +
                                              new DateFormat.jm().format(d1),
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 2.5,
                                          style: GoogleFonts.getFont(
                                              'Source Sans Pro')))),
                              SizedBox(
                                  height: 75,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text("To",
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 3,
                                          style: GoogleFonts.getFont(
                                              'Source Sans Pro')))),
                              Container(
                                  color: Color(0xffadd6ff),
                                  child: InkWell(
                                      onTap: () => _selectDate(context, d2, 2),
                                      child: Text(
                                          new DateFormat.yMMMd().format(d2) +
                                              "\n" +
                                              new DateFormat.jm().format(d2),
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 2.5,
                                          style: GoogleFonts.getFont(
                                              'Source Sans Pro'))))
                            ])),

                    SizedBox(height: 75, width: double.infinity),

                    // Submit
                    SizedBox(
                      height: 75,
                      width: double.infinity,
                      child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            data.add(myController.text);
                            data.add(d1);
                            data.add(d2);

                            getHttp(data);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmation()));
                          },
                          child: Text("Submit",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont('Source Sans Pro'))),
                    ),
                  ],
                ))));
  }
}
