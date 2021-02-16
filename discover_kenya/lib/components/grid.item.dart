import 'package:flutter/material.dart';
import 'package:discover_kenya/components/card_item.dart';

class GridItem extends StatelessWidget {
  final String imageURL;

  GridItem({Key key, this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: ItemCard(iURL: imageURL),
    );
  }
}
