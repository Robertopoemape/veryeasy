import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../product/providers/product_notifier.dart';
import '../../product/widgets/product_grid.dart';
import 'subtitle_category.dart';

class FeaturedProduct extends ConsumerWidget {
  const FeaturedProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(productNotifierProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleCategory(
          title: 'Productos Destacados',
        ),
        gap10,
        Padding(
          padding: const EdgeInsets.all(ds12),
          child: ProductGrid(products: productNotifier.staticProducts),
        ),
      ],
    );
  }
}
