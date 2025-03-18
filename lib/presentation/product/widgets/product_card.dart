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
          Container(
            alignment: Alignment.center,
            height: ds120,
            child: CompImageSvg(
              pathNetwork: product.image,
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
                  maxLines: ints2,
                ),
                gap4,
                Text(
                  'S/ ${product.price.toStringAsFixed(ints2)}',
                  style: ComTextStyle.subtitle1.blue600,
                ),
                gap8,
                CompButton(
                  paddingContent: EdgeInsets.zero,
                  height: ds30,
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
