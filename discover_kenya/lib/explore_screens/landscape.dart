import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Landscapedetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Landscape'),
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
                  "https://images.unsplash.com/photo-1584551395436-6444f9d40a68?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=854&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "cow",
                  "https://images.unsplash.com/photo-1596404765837-78937442ed92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "dog",
                  "https://images.unsplash.com/photo-1596404766014-e43c3809116b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=752&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "kim",
                  "https://images.unsplash.com/photo-1592334688399-32a7593f38eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=785&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pay",
                  "https://images.unsplash.com/photo-1601568588522-dfdb2c85d80a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80&fit=crop&w=500&q=60"),
              captionText("Landscape", "Nyanza Kenya"),
              Imageurl(context, "pat",
                  "https://images.unsplash.com/photo-1589314559908-3cc758e0c073?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "pima",
                  "https://images.unsplash.com/photo-1606369779254-655367752fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1355&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "penys",
                  "https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hat",
                  "https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80&fit=crop&w=500&q=60"),
              Imageurl(context, "hio",
                  "https://images.unsplash.com/photo-1602047320600-97ddf9298b94?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80&fit=crop&w=500&q=60"),
              captionText("Landscape", "Kabarnet Kenya"),
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
