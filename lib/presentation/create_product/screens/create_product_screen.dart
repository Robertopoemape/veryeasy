import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/create_product_notifier.dart';
import '../widgets/widgets.dart';

@RoutePage()
class CreateProductScreen extends ConsumerWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(createProductNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Producto', style: ComTextStyle.h6),
        centerTitle: true,
        backgroundColor: ComColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainDataSection(productNotifier),
            gap8,
            ComDivider(),
            gap8,
            _buildAdditionalInfoSection(productNotifier),
            gap8,
            ComDivider(),
            gap8,
            _buildAdvancedAttributesSection(productNotifier),
            gap8,
            _buildSaveButton(productNotifier),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDataSection(CreateProductNotifier productNotifier) {
    return CreateProductCard(
      columnList: [
        CreateProductSectionTitle(title: 'Datos principales'),
        gap8,
        CompInputText(
          labelText: 'Nombre del producto',
          onChangedText: (value) =>
              productNotifier.updateField(fieldName: 'name', value: value),
        ),
        Row(
          children: [
            Expanded(
              child: CompInputText(
                labelText: 'Stock',
                keyboardType: TextInputType.number,
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
                onChanged: (value) => productNotifier.updateField(
                    fieldName: 'unitMeasurement', value: value!),
              ),
            ),
            space16,
            Expanded(
              child: CompInputText(
                labelText: 'Contenido',
                keyboardType: TextInputType.number,
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
                onChanged: (value) => productNotifier.updateField(
                    fieldName: 'description', value: value),
              ),
            ),
            CreateProductCamera(),
          ],
        ),
        CompImageSvg(
          pathNetwork: 'assets/img/png/not-img.png',
        ),
      ],
    );
  }

  Widget _buildAdditionalInfoSection(CreateProductNotifier productNotifier) {
    return CreateProductCard(
      columnList: [
        CreateProductSectionTitle(title: 'Información adicional'),
        gap8,
        CompInputText(
          labelText: 'Marca',
          onChangedText: (value) =>
              productNotifier.updateField(fieldName: 'brand', value: value),
        ),
        CompInputText(
          labelText: 'Stock mínimo',
          keyboardType: TextInputType.number,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'minStock',
            value: int.tryParse(value) ?? 0,
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedAttributesSection(
      CreateProductNotifier productNotifier) {
    return CreateProductCard(
      columnList: [
        CreateProductSectionTitle(title: 'Atributos avanzados'),
        CompInputText(
          labelText: 'SKU',
          onChangedText: (value) =>
              productNotifier.updateField(fieldName: 'sku', value: value),
        ),
        CompInputText(
          labelText: 'Código de barras',
          onChangedText: (value) =>
              productNotifier.updateField(fieldName: 'barcode', value: value),
        ),
        CompInputText(
          labelText: 'Peso (Kg)',
          keyboardType: TextInputType.number,
          onChangedText: (value) => productNotifier.updateField(
            fieldName: 'weight',
            value: double.tryParse(value) ?? 0.0,
          ),
        ),
        CompInputText(
          labelText: 'Dimensiones (Alto x Ancho x Profundidad)',
          onChangedText: (value) => productNotifier.updateField(
              fieldName: 'dimensions', value: value),
        ),
      ],
    );
  }

  Widget _buildSaveButton(CreateProductNotifier productNotifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ds16),
      child: CompButton(
        onPressed: !productNotifier.isValid
            ? null
            : () async => await productNotifier.saveProduct(),
        name: 'Guardar',
      ),
    );
  }
}
