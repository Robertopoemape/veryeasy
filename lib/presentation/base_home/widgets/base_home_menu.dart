import 'package:flutter/material.dart';

class BaseHomeOpenMenu extends StatelessWidget {
  const BaseHomeOpenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.menu),
        );
      },
    );
  }
}
