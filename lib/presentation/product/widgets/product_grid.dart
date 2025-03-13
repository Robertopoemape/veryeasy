import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../src/entities/product.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(
            child: Text(
            'No hay productos disponibles.',
            style: ComTextStyle.h6.w500,
          ))
        : SingleChildScrollView(
            child: Wrap(
              spacing: ds12,
              runSpacing: ds12,
              children: products.map((product) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / ds2 - ds12 * 1.5,
                  child: ProductCard(
                    product: product,
                    onPressedShoop: () {},
                  ),
                );
              }).toList(),
            ),
          );
  }
}
