import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.icon,
    required this.title,
    super.key,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: ds16),
          padding: const EdgeInsets.all(ds12),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: ds30, color: Colors.deepPurple),
        ),
        gap6,
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
