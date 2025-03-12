import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('Detalle de Video')));
}
