import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../providers/create_product_notifier.dart';

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(
      createProductNotifierProvider.select((state) => state.product.isValid),
    );

    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompButton(
      onPressed: !isValid
          ? null
          : () async => await productNotifier.saveProduct(context),
      name: 'Guardar',
    );
  }
}
