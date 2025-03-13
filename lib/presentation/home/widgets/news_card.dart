import 'package:flutter/material.dart';

import '../../../core/core.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.title,
    required this.image,
    super.key,
  });

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ds200,
      margin: const EdgeInsets.only(right: ds10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ds10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(ds10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ds10),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(ds07), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(title, style: ComTextStyle.body2.w800.white),
      ),
    );
  }
}
