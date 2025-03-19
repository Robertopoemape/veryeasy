import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../providers/create_product_notifier.dart';
import 'widgets.dart';

class AdvancedAttributesProduct extends ConsumerWidget {
  const AdvancedAttributesProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProductNotifier = ref
        .read(createProductNotifierProvider.select((state) => state.product));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Atributos avanzados'),
        CompInputText(
          labelText: 'SKU',
          initialValue: createProductNotifier.sku,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'sku',
            value: value,
          ),
        ),
        CompInputText(
          labelText: 'Código de barras',
          initialValue: createProductNotifier.barcode,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'barcode',
            value: value,
          ),
        ),
        CompInputText(
          labelText: 'Peso (Kg)',
          keyboardType: TextInputType.number,
          initialValue: createProductNotifier.weight.toString(),
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'weight',
            value: double.tryParse(value) ?? 0.0,
          ),
        ),
        CompInputText(
          labelText: 'Dimensiones (Alto x Ancho x Profundidad)',
          initialValue: createProductNotifier.dimensions,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'dimensions',
            value: value,
          ),
        ),
      ],
    );
  }
}
