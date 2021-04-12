import 'package:discover_kenya/components/image_post.dart';
import 'package:discover_kenya/home.dart';
import 'package:discover_kenya/onboard.dart';
import 'package:discover_kenya/settings.dart';
import 'package:discover_kenya/upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:discover_kenya/help.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:discover_kenya/upload_image.dart';

var user = FirebaseAuth.instance.currentUser;

class Profile extends StatefulWidget {
  final String uid;

  Profile({Key key, this.uid}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Position _currentPosition;
  String _currentAddress;
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
                style: GoogleFonts.raleway(fontSize: 14.0, color: Colors.black),
              ),
              downloadButton,
              shareButton,
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: FutureBuilder(
            future: FirebaseDatabase.instance
                .reference()
                .child("Users")
                .child(widget.uid)
                .once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.value['name'],
                    style: GoogleFonts.raleway(
                        fontSize: 18.0, color: Colors.black));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (content) => [
                PopupMenuItem(
                  value: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Text(
                      "Settings",
                      style: GoogleFonts.raleway(
                          fontSize: 13.0,
                          letterSpacing: .03,
                          color: Colors.black),
                    ),
                  ),
                ),
                PopupMenuItem(
                    value: 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help()),
                        );
                      },
                      child: Text(
                        "Help",
                        style: GoogleFonts.raleway(
                            fontSize: 13.0,
                            letterSpacing: .03,
                            color: Colors.black),
                      ),
                    )),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.lightBlue[700],
                  child: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .reference()
                        .child("Users")
                        .child(widget.uid)
                        .once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.value['name'].substring(0, 1),
                            style: GoogleFonts.raleway(fontSize: 18.0));
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Align(
                  child: FutureBuilder(
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
                              fontSize: 18.0,
                              letterSpacing: .04,
                              fontWeight: FontWeight.bold),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                if (_currentAddress != null)
                  Text(
                    _currentAddress,
                    style:
                        GoogleFonts.raleway(letterSpacing: .3, fontSize: 15.0),
                  ),
                TextButton(
                    onPressed: () {
                      _getCurrentLocation();
                    },
                    child: Text("Get Location",
                        style: GoogleFonts.raleway(
                            fontSize: 16.0, letterSpacing: .2))),
                TextButton(
                  autofocus: true,
                  child: Text(
                    "Upload Images",
                    style: GoogleFonts.raleway(fontSize: 16.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UploadImage(
                              uid: widget.uid,
                            )));
                  },
                ),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("posts")
                //       .snapshots(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData) {
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     } else {
                //       return ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: snapshot.data.docs.length,
                //         itemBuilder: (context, index) {
                //           Map<String, dynamic> postMap =
                //               snapshot.data.docs[index].data();

                //           Post post = Post(
                //               postMap['imageUrl'],
                //               postMap['description'],
                //               postMap['author'],
                //               postMap['location']);
                //           return _cardUI(post);
                //         },
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
        drawer: NavigateDrawer(
          uid: widget.uid,
        ));
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
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
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Upload())),
            ),
            title: Text(
              'Upload',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Upload()));
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: new IconButton(
              icon:
                  new Icon(Icons.account_circle_outlined, color: Colors.black),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile())),
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.raleway(fontSize: 15.0, letterSpacing: .25),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
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
