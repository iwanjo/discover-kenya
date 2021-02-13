import 'package:discover_kenya/onboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:discover_kenya/home.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prevButton = FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Onboard()),
        );
      },
      child: Image.asset(
        "assets/back-button.png",
        width: 40.0,
        height: 40.0,
      ),
    );

    final logo = Image.asset(
      "assets/logo.png",
      width: 48.0,
      height: 48.0,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.24), BlendMode.darken),
              image: AssetImage('assets/signup.jpg'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: logo,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: prevButton,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Create an account with us",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 17.0),
                              ),
                              Text(
                                "Get started for free",
                                style: GoogleFonts.raleway(
                                  color: Colors.grey[600],
                                  fontSize: 17.0,
                                  letterSpacing: .3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
