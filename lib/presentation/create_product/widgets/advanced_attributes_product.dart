import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../providers/create_product_notifier.dart';
import 'widgets.dart';

class AdvancedAttributesProduct extends ConsumerWidget {
  const AdvancedAttributesProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    final productState = ref.watch(createProductNotifierProvider).product;

    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Atributos avanzados'),
        _buildInputText(
          labelText: 'SKU',
          initialValue: productState.sku,
          onChanged: (value) =>
              productNotifier.updateField(fieldName: 'sku', value: value),
        ),
        _buildInputText(
          labelText: 'Código de barras',
          initialValue: productState.barcode,
          onChanged: (value) =>
              productNotifier.updateField(fieldName: 'barcode', value: value),
        ),
        _buildInputText(
          labelText: 'Peso (Kg)',
          keyboardType: TextInputType.number,
          initialValue: productState.weight.toString(),
          onChanged: (value) => productNotifier.updateField(
            fieldName: 'weight',
            value: double.tryParse(value) ?? 0.0,
          ),
        ),
        _buildInputText(
          labelText: 'Dimensiones (Alto x Ancho x Profundidad)',
          initialValue: productState.dimensions,
          onChanged: (value) => productNotifier.updateField(
              fieldName: 'dimensions', value: value),
        ),
        SaveButton(),
      ],
    );
  }

  Widget _buildInputText({
    required String labelText,
    required String initialValue,
    required Function(String) onChanged,
    TextInputType? keyboardType,
  }) {
    return CompInputText(
      labelText: labelText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      onChangedText: onChanged,
    );
  }
}
