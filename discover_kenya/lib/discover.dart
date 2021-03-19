import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    final List<String> discoverCategories = <String>[
      "Adventure",
      "Architectural",
      "Beach",
      "Culture",
      "Fashion",
      "Food",
      "Golden Hour",
      "Landscape",
      "Night",
      "Sport",
      "Wildlife",
    ];

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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05,
                  bottom: MediaQuery.of(context).size.width * .02,
                  left: MediaQuery.of(context).size.width * .07),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Explore Categories",
                          style: GoogleFonts.raleway(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              letterSpacing: .5),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: flag,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: discoverCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .4,
                    color: Colors.lightBlue[700],
                    child: Center(
                        child: Text(
                      '${discoverCategories[index]}',
                      style: GoogleFonts.raleway(
                          letterSpacing: .3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
