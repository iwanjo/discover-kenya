import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Creativedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Creative'),
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
                  "https://images.unsplash.com/photo-1529854140025-25995121f16f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "cow",
                  "https://images.unsplash.com/photo-1591871987673-f1513e38493b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=596&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "dog",
                  "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "kim",
                  "https://images.unsplash.com/photo-1525909002-1b05e0c869d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pay",
                  "https://images.unsplash.com/photo-1475669698648-2f144fcaaeb1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              captionText("Creative", "Nakuru Kenya"),
              Imageurl(context, "pat",
                  "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pima",
                  "https://images.unsplash.com/photo-1468421870903-4df1664ac249?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "penys",
                  "https://images.unsplash.com/photo-1534383322781-87885cf4c5d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=766&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hat",
                  "https://images.unsplash.com/photo-1466838931486-92f3b5ff31a6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=887&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hio",
                  "https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80&fit=crop&w=500&q=60"),
              captionText("Creative", "Riftvalley Kenya"),
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
