import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'onboard.dart';
import 'signup.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;
  final String title = "Home";

  final signedInMessage = Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 30.0)),
      Text(
        'Explore Furaha',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context);

    final bookTherapy = Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(14.0),
      color: Colors.blue[400],
      child: MaterialButton(
        minWidth: buttonSize.size.width / 0.9,
        height: 100.0,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Book a Therapy Session',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        splashColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Onboard()),
          );
        },
      ),
    );

    final readArticle = Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(14.0),
      color: Colors.blue[400],
      child: MaterialButton(
        minWidth: buttonSize.size.width / 0.9,
        height: 100.0,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Read our content',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        splashColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Onboard()),
          );
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => EmailSignUp()),
                      (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),

        // Attempting to add bottom navigation

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.book_online),
              label: 'Book a Session',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              label: 'Read our content',
            ),
          ],
        ),
        body: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 100.0)),
                signedInMessage,
                Padding(padding: EdgeInsets.only(top: 80.0)),
                bookTherapy,

                Padding(padding: EdgeInsets.only(top: 60.0)),
                readArticle,

                // attempting to add bottom navigation
              ],
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
                child: Text('AW', style: TextStyle(color: Colors.black87))),
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
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(uid: widget.uid)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Settings'),
            onTap: () {
              print(widget.uid);
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.power_settings_new, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignUp()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
