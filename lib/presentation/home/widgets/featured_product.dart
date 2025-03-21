import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';

import '../../../core/core.dart';
import '../../product/providers/product_notifier.dart';
import '../../product/widgets/product_list.dart';

class FeaturedProduct extends ConsumerWidget {
  const FeaturedProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompSubtitle(
          title: 'Productos Destacados',
        ),
        gap10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ds12),
          child: productState.when(
            data: (state) => ProductList(products: state.products),
            loading: () => CompLoading(),
            error: (error, stackTrace) =>
                CompError(message: error.toString(), onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
