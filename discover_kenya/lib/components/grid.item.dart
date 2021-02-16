import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final IconData iconName;

  GridItem({Key key, this.title, this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Theme.of(context).primaryColor,
        shadowColor: Colors.orange,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconName,
              color: Colors.white,
              size: 70,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
