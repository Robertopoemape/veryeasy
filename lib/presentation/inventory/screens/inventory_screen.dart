import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Inventario')));
}
