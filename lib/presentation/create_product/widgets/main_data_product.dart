import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/create_product_notifier.dart';
import 'widgets.dart';

class MainDataProduct extends ConsumerWidget {
  const MainDataProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProductNotifier = ref
        .read(createProductNotifierProvider.select((state) => state.product));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Datos principales'),
        gap8,
        CompInputText(
          labelText: 'Nombre del producto',
          initialValue: createProductNotifier.name,
          onChangedText: (value) =>
              productNotifier.updateField(fieldName: 'name', value: value),
        ),
        Row(
          children: [
            Expanded(
              child: CompInputText(
                labelText: 'Stock',
                keyboardType: TextInputType.number,
                initialValue: createProductNotifier.stock.toString(),
                onChangedText: (value) => productNotifier.updateField(
                  fieldName: 'stock',
                  value: int.tryParse(value) ?? 0,
                ),
              ),
            ),
            space16,
            Expanded(
              child: CompInputText(
                labelText: 'Precio',
                keyboardType: TextInputType.number,
                initialValue: createProductNotifier.price.toString(),
                onChangedText: (value) => productNotifier.updateField(
                  fieldName: 'price',
                  value: double.tryParse(value) ?? 0.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CompDropdown(
                items: ['UND', 'CAJA', 'PQT', 'BOLSA'],
                hintText: 'U.M',
                initialValue: createProductNotifier.unitMeasurement,
                onChanged: (value) => productNotifier.updateField(
                  fieldName: 'unitMeasurement',
                  value: value!,
                ),
              ),
            ),
            space16,
            Expanded(
              child: CompInputText(
                labelText: 'Contenido',
                keyboardType: TextInputType.number,
                initialValue: createProductNotifier.contentUnit.toString(),
                onChangedText: (value) => productNotifier.updateField(
                  fieldName: 'contentUnit',
                  value: int.tryParse(value) ?? 0,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CompTextArea(
                labelText: 'Descripción',
                initialValue: createProductNotifier.description,
                onChanged: (value) => productNotifier.updateField(
                  fieldName: 'description',
                  value: value,
                ),
              ),
            ),
            CreateProductCamera(),
          ],
        ),
        ImageContainer(),
        SaveButton(),
      ],
    );
  }
}
