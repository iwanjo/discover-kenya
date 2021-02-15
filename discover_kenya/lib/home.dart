import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboard.dart';
import 'signup.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/black-logo.png",
      width: 38.0,
      height: 38.0,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: logo,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
            // IconButton(
            //   icon: Icon(
            //     Icons.exit_to_app,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     FirebaseAuth auth = FirebaseAuth.instance;
            //     auth.signOut().then((res) {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(builder: (context) => EmailSignUp()),
            //           (Route<dynamic> route) => false);
            //     });
            //   },
            // ),
          ],
        ),

        // Bottom Navbar items. Added fixed to the type, to ensure we can add more than 3 items.

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.lightBlue[700],
          selectedLabelStyle: GoogleFonts.raleway(
              fontSize: 15.0, letterSpacing: .3, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.raleway(
              fontSize: 14.0, letterSpacing: .2, color: Colors.black),
          iconSize: 20.0,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, color: Colors.black),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.black),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[],
            ),
          ),
        ),
        drawer: NavigateDrawer(uid: this.uid));
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;
  NavigateDrawer({Key key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['email']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('AW', style: GoogleFonts.raleway(fontSize: 14.0))),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['name']);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            decoration: BoxDecoration(
              color: Colors.lightBlue[700],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Home',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.search, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Search',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.explore_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Discover',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.upload_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Upload',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon:
                  new Icon(Icons.account_circle_outlined, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              print(widget.uid);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.logout, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Sign Out',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Onboard()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
