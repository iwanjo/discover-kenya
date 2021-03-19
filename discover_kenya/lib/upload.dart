import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/black-logo.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );
    return Scaffold(
        backgroundColor: Colors.white,
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
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .05),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/upload-page.jpeg",
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .48),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Upload Files",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .56,
                  left: MediaQuery.of(context).size.width * .14,
                  right: MediaQuery.of(context).size.width * .14,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Browse the files you want to upload",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .65),
                child: MaterialButton(
                  color: Colors.lightBlue[700],
                  shape: CircleBorder(),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Icon(
                        Icons.upload_file,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
