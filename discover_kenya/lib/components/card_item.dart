import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String iURL;

  ItemCard({Key key, this.iURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        iURL,
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
    );
  }
}
