import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Fooddetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Food'),
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
                  "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=353&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "cow",
                  "https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "dog",
                  "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "kim",
                  "https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pay",
                  "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=333&q=80&fit=crop&w=500&q=60"),
              captionText("Food", "Popular dishes"),
              Imageurl(context, "pat",
                  "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pima",
                  "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "penys",
                  "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=414&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hat",
                  "https://images.unsplash.com/photo-1484980972926-edee96e0960d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hio",
                  "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80&fit=crop&w=500&q=60"),
              captionText("Food", "Vegan food"),
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
