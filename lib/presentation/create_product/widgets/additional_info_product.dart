import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../providers/create_product_notifier.dart';
import 'widgets.dart';

class AdditionalInfoProduct extends ConsumerWidget {
  const AdditionalInfoProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(createProductNotifierProvider.notifier);
    final createProductNotifier =
        ref.watch(createProductNotifierProvider).product;

    CompInputText buildInputField({
      required String labelText,
      required String initialValue,
      required void Function(String) onChanged,
      TextInputType keyboardType = TextInputType.text,
    }) {
      return CompInputText(
        labelText: labelText,
        initialValue: initialValue,
        onChangedText: onChanged,
        keyboardType: keyboardType,
      );
    }

    return CreateProductCard(
      columnList: [
        buildInputField(
          labelText: 'Familia',
          initialValue: createProductNotifier.family ?? '',
          onChanged: (value) =>
              productNotifier.updateField(fieldName: 'family', value: value),
        ),
        buildInputField(
          labelText: 'Categoría',
          initialValue: createProductNotifier.category ?? '',
          onChanged: (value) =>
              productNotifier.updateField(fieldName: 'category', value: value),
        ),
        buildInputField(
          labelText: 'Stock mínimo',
          initialValue: createProductNotifier.minStock.toString(),
          onChanged: (value) => productNotifier.updateField(
            fieldName: 'minStock',
            value: int.tryParse(value) ?? 0,
          ),
          keyboardType: TextInputType.number,
        ),
        SaveButton(),
      ],
    );
  }
}
