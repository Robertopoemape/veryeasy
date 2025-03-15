import 'package:flutter/material.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/entities/product.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? CompListEmpty(
            icon: Icons.store,
            label: 'Productos',
            onPressed: () {
              autoRouterPush(context, CreateProductRoute());
            },
          )
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
