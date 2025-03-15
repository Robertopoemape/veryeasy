import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import 'category_item.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompSubtitle(
          title: 'Categorías',
        ),
        gap10,
        SizedBox(
          height: ds80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: ds16),
            children: [
              CategoryItem(icon: Icons.phone_android, title: 'Tecnología'),
              CategoryItem(icon: Icons.shopping_bag, title: 'Moda'),
              CategoryItem(icon: Icons.kitchen, title: 'Hogar'),
              CategoryItem(icon: Icons.directions_car, title: 'Autos'),
            ],
          ),
        ),
      ],
    );
  }
}
