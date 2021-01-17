import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';

void getHttp() async {
  const api_key = String.fromEnvironment('api_key');
  const api_secret = String.fromEnvironment('api_secret');
  const numb = String.fromEnvironment('numb');
  const from = String.fromEnvironment('from');

  //!!!! EDIT TEXT FIELD
  try {
    Response response = await Dio().post("https://rest.nexmo.com/sms/json", data: {"from": from, "to": numb, "text": "Hello", "api_key": api_key, "api_secret": api_secret});

    print(response);
  } catch (e) {
    print(e);
  }
}

class Confirmation extends StatefulWidget {
  Confirmation(): super();

  @override
  _MyConfirmationState createState() => _MyConfirmationState();

}
// This widget is the root of your application.
class _MyConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffd6eaff),
        body:
            Center(
              child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Image.asset(
                        'images/che.png',
                        width: 150,
                        height: 150,
                      ),
                  Container(
                    margin: EdgeInsets.only (
                      top: 60,
                          bottom: 20,
                        left: 13,
                      right: 13
                    ),
                  child:
                  Text(
                    'Our system has processed your booking, thank you for using SitDown!',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Source Sans Pro', fontSize: 20))
                  ),
                  Container(
                      margin: EdgeInsets.only (
                          top: 15,
                          left: 13,
                          right: 13
                      ),
                      child:
                      Text(
                        'You will be receiving a SMS shortly with details of your reservation.',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Source Sans Pro', fontSize: 20)
                      )
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 80),
                    child: RaisedButton(
                        //!!!!!!!! on Pressed!!
                        onPressed: () {
                          getHttp();
                        },
                        child:
                        Text(
                          'Back to Dashboard',
                            style: GoogleFonts.getFont('Source Sans Pro')
                        ),
                        textColor: Colors.black,
                        color: Color(0xff84c1ff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)
                        ),
                        padding: EdgeInsets.all(15)
                      )
                  )
                    ]
                  )
            ),
    );
  }
}





