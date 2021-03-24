import 'package:discover_kenya/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'help.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Violet'),
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
                  )),
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

          // IconButton(
          //   icon: Icon(Icons.more_vert),
          //   onPressed: () {},
          // ),
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
                backgroundColor: Colors.grey,
                radius: 50.0,
                child: Text(
                  'VK',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Violet Kariuki',
                style: TextStyle(color: Colors.black87, fontSize: 25.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter your one line bio here',
                style: TextStyle(color: Colors.black87, fontSize: 20.0),
              ),
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
}
