import 'package:flutter/material.dart';

class BaseHomeMenu extends StatelessWidget {
  const BaseHomeMenu({super.key});

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
