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
    final isLoading = ref.read(createProductNotifierProvider).isLoading;

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Registro de Producto', style: ComTextStyle.h6),
          centerTitle: true,
          backgroundColor: ComColors.primaryColor,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
            _buildMainDataSection(ref),
            gap8,
            ComDivider(),
            gap8,
            _buildAdditionalInfoSection(ref),
            gap8,
            ComDivider(),
            gap8,
            _buildAdvancedAttributesSection(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDataSection(WidgetRef ref) {
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
        if (createProductNotifier.image.isNotEmpty) ...[
          CompImageSvg(
            pathNetwork: createProductNotifier.image,
            width: ds250,
            height: ds250,
            fit: BoxFit.cover,
          ),
          gap8,
        ],
        SaveButton(),
      ],
    );
  }

  Widget _buildAdditionalInfoSection(WidgetRef ref) {
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

  Widget _buildAdvancedAttributesSection(WidgetRef ref) {
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

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(
      createProductNotifierProvider.select((state) => state.product.isValid),
    );

    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompButton(
      onPressed:
          !isValid ? null : () async => await productNotifier.saveProduct(),
      name: 'Guardar',
    );
  }
}
