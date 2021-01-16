import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
                        width: 200,
                        height: 200,
                      ),
                  Container(
                    margin: EdgeInsets.only (
                      top: 15
                    ),
                  child:
                  Text(
                    'Our system has processed your booking, thank you for using SitDown!',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Source Sans Pro'),
                  )
                  ),

                      Text(
                        'You will be receiving a SMS shortly with details of your reservation.',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Source Sans Pro'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100.0),
                        child: RaisedButton(
                            onPressed: () {},
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





