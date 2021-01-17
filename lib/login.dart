
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';




class Login extends StatelessWidget {
  final Color primaryColor = Color(0xFFE1F5FE);
  final Color secondaryColor = Color(0xFFB3E5FC);

  final Color logoGreen = Color(0xFF03A9F4);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var google;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body:


        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                _buildFooterLogo(),

                SizedBox(height: 20),
                Text(
                  'Incorrect username or password!',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.black, fontSize: 14),
                ),


              ],
            ),
          ),
        ));
  }


  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
            'images/sit.png',
            height: 180
        ),


        Text('',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),

      ],
    );
  }


  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.lightBlue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}



