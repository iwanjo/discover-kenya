import 'package:discover_kenya/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:discover_kenya/help.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
                  style:
                      GoogleFonts.raleway(fontSize: 18.0, color: Colors.black));
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
                      MaterialPageRoute(builder: (context) => Settings()),
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
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
                height: 30.0,
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
                height: 20.0,
              ),
              Text(
                'Enter your one line bio here',
                style: GoogleFonts.raleway(letterSpacing: .3, fontSize: 15.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              if (_currentAddress != null)
                Text(
                  _currentAddress,
                  style: GoogleFonts.raleway(letterSpacing: .3, fontSize: 15.0),
                ),
              TextButton(
                  onPressed: () {
                    _getCurrentLocation();
                  },
                  child: Text("Get Location",
                      style: GoogleFonts.raleway(
                          fontSize: 14.0, letterSpacing: .2))),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black87),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black87),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black87),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/no-camera.png'),
                  height: 100.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'No posts yet',
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
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
