import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'COVID Screening Form',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new COVIDScreening(title: 'COVID Screening Form'),
    );
  }
}

class COVIDScreening extends StatefulWidget {
  COVIDScreening({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _COVIDScreeningState createState() => new _COVIDScreeningState();
}

bool qOneSwitched = false;
bool qTwoSwitched = false;
bool qThreeSwitched = false;
bool qFourSwitched = false;
bool qFiveSwitched = false;
bool qSixSwitched = false;

class _COVIDScreeningState extends State<COVIDScreening> {
  @override
  Widget build(BuildContext context) {

    void _submitForm() {
      print('Q1:  $qOneSwitched');
      print('Q2:  $qTwoSwitched');
      print('Q3:  $qThreeSwitched');
      print('Q4:  $qFourSwitched');
      print('Q5:  $qFiveSwitched');
      print('Q6:  $qSixSwitched');
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            //leading: const Icon(Icons.person),
            title: new SwitchListTile(
              title: Text('Have you travelled outside of Canada in the last 14 days?'),
              value: qOneSwitched,
              onChanged:(newValue) {
                setState(() {
                  qOneSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          new ListTile(
            //leading: const Icon(Icons.person),
            title: new SwitchListTile(
              title: Text('Has someone you are in close contact with tested positive for COVID-19 in the last 14 days?'),
              value: qTwoSwitched,
              onChanged:(newValue) {
                setState(() {
                  qTwoSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          new ListTile(
            //leading: const Icon(Icons.person),
            title: new SwitchListTile(
              title: Text('Are you in close contact with a person who is sick with new respiratory symptoms or who recently traveled outside of Canada?'),
              value: qThreeSwitched,
              onChanged:(newValue) {
                setState(() {
                  qThreeSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          new ListTile(
            //leading: const Icon(Icons.person),
            title: new SwitchListTile(
              title: Text('Do you have a fever? (temperature ≥ 37.8 °C)'),
              value: qFourSwitched,
              onChanged:(newValue) {
                setState(() {
                  qFourSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          new ListTile(
            //leading: const Icon(Icons.person),
            title: new SwitchListTile(
              title: Text('Do you have any of the following symptoms?'),
              subtitle: Text('Chills, New or worsening cough (dry or productive), Barking Cough (croup), '
                  'Shortness of breath/difficulty breathing, Sore throat, Difficulty swallowing, Loss of taste or smell,'
                  ' Pink eye (conjunctivitis), Headache that is unusual or long-lasting, Runny or stuffy nose (not related '
                  'to seasonal allergies or other known causes or conditions), Nausea/vomiting/diarrhea/abdominal pain, '
                  'Muscle aches, Unexplained fatigue/malaise, Falling more than usual'),
              value: qFiveSwitched,
              onChanged:(newValue) {
                setState(() {
                  qFiveSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          Spacer(),
          const Divider(
            height: 1.0,
          ),
          new ListTile(
            //leading: const Icon(Icons.person),
            leading: const Icon(Icons.label),
            title: new SwitchListTile(
              title: Text('I hereby declare that the information provided is true and correct.'),
              value: qSixSwitched,
              onChanged:(newValue) {
                setState(() {
                  qSixSwitched = newValue;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          Spacer(flex:3),
          RaisedButton(
            color: Colors.lightBlue,
            onPressed: _submitForm,
            child: Text("Submit", style: TextStyle(fontSize: 20),),
          ),
          Spacer(),
          const Divider(
            height: 1.0,
          ),
        ],
      ),
    );
  }
}