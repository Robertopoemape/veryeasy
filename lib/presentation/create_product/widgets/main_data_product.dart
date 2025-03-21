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
    final createProductNotifier =
        ref.watch(createProductNotifierProvider).product;
    final controller = ref.watch(createProductNotifierProvider.notifier);
    final productNotifier = ref.watch(createProductNotifierProvider.notifier);
    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Datos principales'),
        gap8,
        CompInputText(
          labelText: 'Nombre del producto',
          controller: controller.nameController,
          initialValue: createProductNotifier.name,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'name',
            value: value,
          ),
        ),
        CompInputText(
          labelText: 'Marca',
          controller: controller.brandController,
          initialValue: createProductNotifier.brand,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'brand',
            value: value,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CompInputText(
                labelText: 'Stock',
                keyboardType: TextInputType.number,
                controller: controller.stockController,
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
                controller: controller.priceController,
                initialValue: createProductNotifier.price.toString(),
                onChangedText: (value) => productNotifier.updateField(
                  fieldName: 'price',
                  value: int.tryParse(value) ?? 0,
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
                controller: controller.unitMeasurement,
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
                controller: controller.contentUnitController,
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
                controller: controller.descriptionController,
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
