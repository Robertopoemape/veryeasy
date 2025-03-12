import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Dashboard')));
}
