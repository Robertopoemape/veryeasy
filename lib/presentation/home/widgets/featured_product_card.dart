import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class FeaturedProductCard extends StatelessWidget {
  const FeaturedProductCard(
      {required this.image,
      required this.title,
      required this.price,
      super.key});

  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ds4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ds12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ds12, vertical: ds8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(ds12)),
              child: Image.asset(
                image,
                height: ds150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: ComTextStyle.body2,
              overflow: TextOverflow.ellipsis,
              maxLines: ints2,
            ),
            Text(price, style: ComTextStyle.caption),
            const Spacer(),
            CompButton(
              name: 'Comprar',
              borderColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
