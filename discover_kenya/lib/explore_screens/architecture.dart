import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Architecturedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Architecture'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: Colors.white,
          ),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            staggeredTiles: [
              StaggeredTile.count(4, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(4, 1),
              StaggeredTile.count(4, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(4, 1),
            ],
            children: <Widget>[
              Imageurl(context, "rat",
                  "https://images.unsplash.com/photo-1567450213298-e7a1824f6636?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fGFmcmljYSUyMGFyY2hpdGVjdHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60&fit=crop&w=633&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "cow",
                  "https://images.unsplash.com/photo-1542370627899-55ce3b20abf9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "dog",
                  "https://851780.smushcdn.com/1832394/wp-content/uploads/2019/01/FF01.jpg?lossy=1&strip=0&webp=1&fit=crop&w=500&q=60"),
              Imageurl(context, "kim",
                  "https://images.unsplash.com/photo-1600168092637-6ef310988576?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pay",
                  "https://images.unsplash.com/photo-1614075565833-7d31bb969f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=675&q=80&fit=crop&w=500&q=60"),
              captionText("Architecture", "Nairobi CBD"),
              Imageurl(context, "pat",
                  "https://i.imgur.com/82QpDoH.jpg&fit=crop&w=500&q=60"),
              Imageurl(context, "pima",
                  "https://i.imgur.com/cr6wMIm.jpeg&fit=crop&w=500&q=60"),
              Imageurl(context, "penys",
                  "https://images.unsplash.com/photo-1602578984228-c98a9b995f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "hat",
                  "https://images.unsplash.com/photo-1576066229267-54e2762a128a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60&fit=crop&w=500&q=60"),
              Imageurl(context, "hio",
                  "https://images.unsplash.com/photo-1525945995886-0ede2bd49ab6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80&fit=crop&w=500&q=60"),
              captionText("Architecture", "Upperhill Nairobi"),
            ],
            padding: const EdgeInsets.all(4.0),
          ),
        ),
      ),
    );
  }

  Widget captionText(String titleText, String subText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  titleText,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  subText,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nav(tag, url) {
    BuildContext context;
    final route = MaterialPageRoute(
        builder: (context) => HeroAnimation(tag: tag, url: url));

    Navigator.push(context, route);
  }

  // ignore: non_constant_identifier_names
  Widget Imageurl(BuildContext context, String tag, String myImages) {
    return Container(
      child: Hero(
        tag: tag,
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HeroAnimation(
                    tag: tag,
                    url: myImages,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(myImages),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  final String tag;
  final String url;

  const HeroAnimation({this.tag, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: Hero(
        tag: tag,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
