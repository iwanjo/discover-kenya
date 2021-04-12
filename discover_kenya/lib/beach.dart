import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Beachdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Beach'),
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
                  "https://images.unsplash.com/photo-1542998967-692be9110b46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "cow",
                  "https://images.unsplash.com/photo-1550496913-b1a19c3779e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "dog",
                  "https://images.unsplash.com/photo-1525344387229-da3782d11618?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "kim",
                  "https://images.unsplash.com/photo-1531496074234-6db4f0226092?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "pay",
                  "https://images.unsplash.com/photo-1522865080725-2a9ea1fcb94e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              captionText("Wildlife", "Popular images"),
              Imageurl(context, "pat",
                  "https://images.unsplash.com/photo-1534546584494-57363237b97f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "pima",
                  "https://images.unsplash.com/photo-1521320226546-87b106956014?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "penys",
                  "https://images.unsplash.com/photo-1486808044402-a7c67ef5ea7b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "hat",
                  "https://images.unsplash.com/photo-1482076791374-bbc7876d9213?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              Imageurl(context, "hio",
                  "https://images.unsplash.com/photo-1483412919093-03a22057d0d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              captionText("Wildlife", "Uknown destinations"),
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
