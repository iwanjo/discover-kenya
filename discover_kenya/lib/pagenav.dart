import 'package:discover_kenya/discover.dart';
import 'package:discover_kenya/home.dart';
import 'package:discover_kenya/likes.dart';
import 'package:discover_kenya/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';

// var user = FirebaseAuth.instance.currentUser;

class Pagenav extends StatefulWidget {
  final String uid;

  Pagenav({Key key, this.uid}) : super(key: key);

  @override
  _PagenavState createState() => _PagenavState();
}

class _PagenavState extends State<Pagenav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(uid: user.uid),
    Discover(),
    Likes(),
    Profile(uid: user.uid)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[200],
                gap: 4,
                activeColor: Colors.lightBlue[700],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                textStyle: GoogleFonts.raleway(
                    letterSpacing: .3, color: Colors.lightBlue[700]),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.fire,
                    text: 'Discover',
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    text: 'Saved',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
