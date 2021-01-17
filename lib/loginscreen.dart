import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:htn_app/home.dart';
import 'main.dart';
import 'Fail.dart';


class LoginScreen extends StatelessWidget {


  final Color primaryColor = Color(0xFFE1F5FE);


  final Color secondaryColor = Color(0xFFB3E5FC);

  final Color logoGreen = Color(0xFF03A9F4);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


    Future<void> signinGoogle(BuildContext context) async {

      WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    try {

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: nameController.text,
          password: passwordController.text
      );

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home())
      );

    } on FirebaseAuthException catch (e) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Fail()),
      );

      if (e.code == 'user-not-found') {

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        print('Wrong password provided for that user.');
      }

      else {

        print(e.code);
        }
    }

  }

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

                Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.black, fontSize:22 ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your email and password to continue!',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.black, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {
                   //return   Login();

                    signinGoogle(context);

                  },
                  color: logoGreen,
                  child: Text('Login',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  textColor: Colors.black,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {

                  /*  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;

                    final AuthCredential credential = GoogleAuthProvider.credential(
                          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

                    final UserCredential user =

                       await FirebaseAuth.instance.signInWithCredential(credential);*/

                  },
                  color: Colors.lightBlue[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.black,
                ),
                SizedBox(height: 100),

                    footer()


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


        Text(' ',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),

      ],
    );
  }

  footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text('© 2021 SitDown All rights reserved ',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 10,
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


