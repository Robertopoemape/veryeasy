import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/product_notifier.dart';
import '../widgets/product_grid.dart';

@RoutePage()
class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ds12),
        child: state.when(
          loading: () => CompLoading(),
          data: (products) => ProductGrid(products: products),
          error: (error, _) => CompError(
            message: error.toString(),
            onPressed: () => ref.read(productProvider.notifier).fetchProducts(),
          ),
        ),
      ),
      floatingActionButton: CompFloactingActionButton(
        onPressed: () => ref.read(productProvider.notifier).fetchProducts(),
      ),
    );
  }
}
