import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/product_notifier.dart';
import '../widgets/product_list.dart';

@RoutePage()
class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsync = ref.watch(productNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ds12),
        child: inventoryAsync.when(
          data: (data) => Stack(
            children: [
              ProductList(products: data.products),
              if (data.isLoading) CompLoading()
            ],
          ),
          loading: () => CompLoading(),
          error: (error, _) => CompError(
            message: error.toString(),
            onPressed: () =>
                ref.read(productNotifierProvider.notifier).fetchProducts(),
          ),
        ),
      ),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'product_fab',
        onPressed: () => ref.read(productNotifierProvider.notifier).refresh(),
      ),
    );
  }
}
