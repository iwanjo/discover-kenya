import 'package:flutter/material.dart';
import 'package:discover_kenya/components/grid.item.dart';


class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 8.0,
      children: [
        GridItem(
          title: 'Account',
          iconName: Icons.account_box,
        ),
        GridItem(
          title: 'Lunch',
          iconName: Icons.lunch_dining,
        ),
      ],
    );
  }

}