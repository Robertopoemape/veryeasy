import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateVideoIAScreen extends StatelessWidget {
  const CreateVideoIAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Crear Video con IA')));
  }
}
