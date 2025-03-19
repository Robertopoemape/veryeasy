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
    final isLoading = ref.watch(createProductNotifierProvider).isLoading;

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
            _buildAdditionalInfoSection(),
            gap8,
            ComDivider(),
            gap8,
            _buildAdvancedAttributesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDataSection(WidgetRef ref) {
    final productImage = ref.watch(
      createProductNotifierProvider.select((state) => state.product.image),
    );
    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Datos principales'),
        gap8,
        NameInput(),
        Row(
          children: [
            Expanded(child: StockInput()),
            space16,
            Expanded(child: PriceInput()),
          ],
        ),
        Row(
          children: [
            Expanded(child: UnitMeasurementDropdown()),
            space16,
            Expanded(child: ContentUnitInput()),
          ],
        ),
        Row(
          children: [
            Expanded(child: DescriptionInput()),
            CreateProductCamera(),
          ],
        ),
        if (productImage.isNotEmpty) ...[
          CompImageSvg(
            pathNetwork: productImage,
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

  Widget _buildAdditionalInfoSection() {
    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Información adicional'),
        gap8,
        BrandInput(),
        MinStockInput(),
      ],
    );
  }

  Widget _buildAdvancedAttributesSection() {
    return CreateProductCard(
      columnList: [
        const CreateProductSectionTitle(title: 'Atributos avanzados'),
        SKUInput(),
        BarcodeInput(),
        WeightInput(),
        DimensionsInput(),
      ],
    );
  }
}

class NameInput extends ConsumerWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productName = ref.watch(
      createProductNotifierProvider.select((state) => state.product.name),
    );
    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompInputText(
      labelText: 'Nombre del producto',
      initialValue: productName,
      onChangedText: (value) =>
          productNotifier.updateField(fieldName: 'name', value: value),
    );
  }
}

class StockInput extends ConsumerWidget {
  const StockInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productStock = ref.watch(
      createProductNotifierProvider.select((state) => state.product.stock),
    );
    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompInputText(
      labelText: 'Stock',
      keyboardType: TextInputType.number,
      initialValue: productStock.toString(),
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'stock',
        value: int.tryParse(value) ?? 0,
      ),
    );
  }
}

class PriceInput extends ConsumerWidget {
  const PriceInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPrice = ref.watch(
        createProductNotifierProvider.select((state) => state.product.price));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Precio',
      keyboardType: TextInputType.number,
      initialValue: productPrice.toString(),
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'price',
        value: double.tryParse(value) ?? 0.0,
      ),
    );
  }
}

class UnitMeasurementDropdown extends ConsumerWidget {
  const UnitMeasurementDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitMeasurement = ref.watch(createProductNotifierProvider
        .select((state) => state.product.unitMeasurement));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompDropdown(
      items: ['UND', 'CAJA', 'PQT', 'BOLSA'],
      hintText: 'U.M',
      initialValue: unitMeasurement,
      onChanged: (value) => productNotifier.updateField(
        fieldName: 'unitMeasurement',
        value: value!,
      ),
    );
  }
}

class ContentUnitInput extends ConsumerWidget {
  const ContentUnitInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentUnit = ref.watch(createProductNotifierProvider
        .select((state) => state.product.contentUnit));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Contenido',
      keyboardType: TextInputType.number,
      initialValue: contentUnit.toString(),
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'contentUnit',
        value: int.tryParse(value) ?? 0,
      ),
    );
  }
}

class DescriptionInput extends ConsumerWidget {
  const DescriptionInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = ref.watch(
      createProductNotifierProvider
          .select((state) => state.product.description),
    );
    final productNotifier = ref.read(createProductNotifierProvider.notifier);

    return CompTextArea(
      labelText: 'Descripción',
      initialValue: description,
      onChanged: (value) => productNotifier.updateField(
        fieldName: 'description',
        value: value,
      ),
    );
  }
}

class BrandInput extends ConsumerWidget {
  const BrandInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brand = ref.watch(
        createProductNotifierProvider.select((state) => state.product.brand));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Marca',
      initialValue: brand,
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'brand',
        value: value,
      ),
    );
  }
}

class MinStockInput extends ConsumerWidget {
  const MinStockInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minStock = ref.watch(createProductNotifierProvider
        .select((state) => state.product.minStock));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Stock mínimo',
      keyboardType: TextInputType.number,
      initialValue: minStock.toString(),
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'minStock',
        value: int.tryParse(value) ?? 0,
      ),
    );
  }
}

class SKUInput extends ConsumerWidget {
  const SKUInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sku = ref.watch(
        createProductNotifierProvider.select((state) => state.product.sku));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'SKU',
      initialValue: sku,
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'sku',
        value: value,
      ),
    );
  }
}

class BarcodeInput extends ConsumerWidget {
  const BarcodeInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barcode = ref.watch(
        createProductNotifierProvider.select((state) => state.product.barcode));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Código de barras',
      initialValue: barcode,
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'barcode',
        value: value,
      ),
    );
  }
}

class WeightInput extends ConsumerWidget {
  const WeightInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weight = ref.watch(
        createProductNotifierProvider.select((state) => state.product.weight));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Peso (Kg)',
      keyboardType: TextInputType.number,
      initialValue: weight.toString(),
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'weight',
        value: double.tryParse(value) ?? 0.0,
      ),
    );
  }
}

class DimensionsInput extends ConsumerWidget {
  const DimensionsInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dimensions = ref.watch(createProductNotifierProvider
        .select((state) => state.product.dimensions));
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompInputText(
      labelText: 'Dimensiones (Alto x Ancho x Profundidad)',
      initialValue: dimensions,
      onChangedText: (value) => productNotifier.updateField(
        fieldName: 'dimensions',
        value: value,
      ),
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.read(createProductNotifierProvider.notifier);
    return CompButton(
      onPressed: !productNotifier.isValid
          ? null
          : () async => await productNotifier.saveProduct(),
      name: 'Guardar',
    );
  }
}
