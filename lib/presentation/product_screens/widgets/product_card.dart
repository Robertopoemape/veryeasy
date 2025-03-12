import 'package:flutter/material.dart';
import 'package:veryeasy/components/components.dart';
import '../../../core/core.dart';
import '../../../src/entities/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onPressedShoop,
  });
  final Product product;
  final VoidCallback onPressedShoop;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ds4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ds12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(ds12)),
            child: Image.asset(
              product.image,
              height: ds150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(ds12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: ComTextStyle.body2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                gap4,
                Text(
                  'S/ ${product.price.toStringAsFixed(ints2)}',
                  style: ComTextStyle.subtitle1.blue600,
                ),
                gap8,
                CompButton(
                  name: 'Comprar',
                  borderColor: ComColors.primaryColor,
                  backgroundColor: ComColors.primaryColor,
                  onPressed: onPressedShoop,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
