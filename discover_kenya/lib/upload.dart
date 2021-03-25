import 'dart:io';
import 'package:discover_kenya/help.dart';
import 'package:discover_kenya/settings.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String imageUrl;
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
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              (imageUrl != null)
                  ? Image.network(imageUrl)
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        'https://o.remove.bg/downloads/a3a1ef44-99a4-48b8-b508-4219c065cbe1/images-removebg-preview.png',
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                      ),
                    ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .48),
                  child: Align(
                    child: ElevatedButton(
                        onPressed: () => uploadImage(),
                        child: Text("Upload Files")),
                  )),
            ],
          ),
        ));
  }

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _firebaseStorage
            .ref()
            .child('images/imageName')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}
