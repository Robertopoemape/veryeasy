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
    final state = ref.watch(productNotifierProvider);

    if (state.maybeWhen(initial: (_) => true, orElse: () => false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(productNotifierProvider.notifier).fetchProducts();
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ds12),
        child: state.when(
          initial: (products) => CompLoading(),
          loading: () => CompLoading(),
          loaded: (products) => ProductGrid(products: products),
          error: (message) => CompError(
            message: message,
            onPressed: () =>
                ref.read(productNotifierProvider.notifier).fetchProducts(),
          ),
        ),
      ),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'product_fab',
        onPressed: () =>
            ref.read(productNotifierProvider.notifier).fetchProducts(),
      ),
    );
  }
}
