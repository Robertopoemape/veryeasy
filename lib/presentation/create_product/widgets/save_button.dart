import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/core/router/router_provider.dart';

import '../../../components/components.dart';
import '../../../core/router/router_provider.gr.dart';
import '../providers/create_product_notifier.dart';

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(
      createProductNotifierProvider.select((state) => state.product),
    );

    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompButton(
      onPressed: !product.isValid
          ? null
          : () async {
              final productId = await productNotifier.saveProduct(context);
              if (productId != null) {
                autoRouterPush(context, ProductSavedRoute(product: product));
              }
            },
      name: 'Guardar',
    );
  }
}
