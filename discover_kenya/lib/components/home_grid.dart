import 'package:flutter/material.dart';
import 'package:discover_kenya/components/grid.item.dart';


class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 8.0,
        children: [
          GridItem(
          ),
          GridItem(
          ),
        ],
      ),
    );
  }

}