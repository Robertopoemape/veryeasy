import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/create_product_notifier.dart';
import 'widgets.dart';

class AdditionalIntoProduct extends ConsumerWidget {
  const AdditionalIntoProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProductNotifier = ref
        .read(createProductNotifierProvider.select((state) => state.product));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Información adicional'),
        gap8,
        CompInputText(
          labelText: 'Marca',
          initialValue: createProductNotifier.brand,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'brand',
            value: value,
          ),
        ),
        CompInputText(
          labelText: 'Stock mínimo',
          keyboardType: TextInputType.number,
          initialValue: createProductNotifier.minStock.toString(),
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'minStock',
            value: int.tryParse(value) ?? 0,
          ),
        ),
      ],
    );
  }
}
