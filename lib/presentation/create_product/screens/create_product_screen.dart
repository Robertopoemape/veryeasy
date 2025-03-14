import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creacion de producto'),
      ),
      body: Center(
        child: Text('Creacion de producto'),
      ),
    );
  }
}
