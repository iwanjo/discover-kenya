import 'package:discover_kenya/discover.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboard.dart';
import 'package:discover_kenya/components/image_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:file_picker/file_picker.dart';

class Home extends StatelessWidget {
  const Home({@required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/black-logo.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );

    final flag = Image.asset(
      "assets/flag.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );

    final square = Container(
      height: 40,
      width: 40,
      // color: Colors.transparent,
      decoration: BoxDecoration(
          color: Colors.lightBlue[700],
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: Center(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );

    final downloadButton = TextButton(
      onPressed: () {},
      child: Image.asset(
        "assets/download.png",
        width: 18.0,
        height: 18.0,
      ),
    );

    final shareButton = TextButton(
      onPressed: () {},
      child: Image.asset(
        "assets/share.png",
        width: 18.0,
        height: 18.0,
      ),
    );

    Widget _cardUI(Post post) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                post.author,
                style: GoogleFonts.raleway(fontSize: 14.0, color: Colors.black),
              ),
              subtitle: Text(
                post.description,
                style: GoogleFonts.raleway(fontSize: 14.0, color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.network(
                post.imageUrl,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  post.location,
                  style:
                      GoogleFonts.raleway(fontSize: 14.0, color: Colors.black),
                ),
                downloadButton,
                shareButton,
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: logo,
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 35.0, left: 25.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Discover Kenya",
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                letterSpacing: .4),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: flag,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Beautiful photos of Kenya",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 19.0,
                            letterSpacing: .4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("posts").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> postMap =
                            snapshot.data.docs[index].data();

                        Post post = Post(
                            postMap['imageUrl'],
                            postMap['description'],
                            postMap['author'],
                            postMap['location']);
                        return _cardUI(post);
                      },
                    );
                  }
                },
              ),
              // Container(
              //   height: 40.0,
              //   margin: EdgeInsets.all(25.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(7.0),
              //     color: Colors.grey[300],
              //   ),
              //   child: Stack(
              //     children: <Widget>[
              //       TextField(
              //         // ignore: deprecated_member_use
              //         maxLengthEnforced: true,
              //         style: GoogleFonts.raleway(fontSize: 15.0),
              //         decoration: InputDecoration(
              //             contentPadding: EdgeInsets.only(
              //               left: 10,
              //               bottom: 10,
              //             ),
              //             border: InputBorder.none,
              //             hintText: "Search Great Photos",
              //             hintStyle: GoogleFonts.raleway(letterSpacing: .2)),
              //       ),
              //       Positioned(
              //         right: 0,
              //         top: 0,
              //         child: square,
              //       ),
              //     ],
              //   ),
              // ),
              // CategoriesTabBar(),
            ],
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
                    return Text(
                      snapshot.data.value['email'],
                      style: GoogleFonts.raleway(
                          letterSpacing: .3, fontSize: 15.0),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.value['name'].substring(0, 1),
                        style: GoogleFonts.raleway(fontSize: 14.0));
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.value['name'],
                      style: GoogleFonts.raleway(
                          letterSpacing: .3, fontSize: 15.0),
                    );
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
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.explore_outlined, color: Colors.black),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Discover())),
            ),
            title: Text(
              'Discover',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Discover()));
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
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
