import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_route/annotations.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../widgets/widgets.dart';

@RoutePage()
class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _minStockController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _contentUnitController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dimensionsController = TextEditingController();

  Future<void> _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      final product = {
        'name': _nameController.text,
        'quantity': int.tryParse(_stockController.text) ?? 0,
        'price': double.tryParse(_priceController.text) ?? 0.0,
        'image': _imageController.text,
        'description': _descriptionController.text,
      };

      await FirebaseFirestore.instance.collection('products').add(product);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto creado con éxito')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registro de Producto',
            style: ComTextStyle.h6,
          ),
          centerTitle: true,
          backgroundColor: ComColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(ds16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateProductCard(
                  columnList: [
                    CreateProductSectionTitle(title: 'Datos principales'),
                    gap8,
                    CompInputText(
                      controller: _nameController,
                      labelText: 'Nombre del producto',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CompInputText(
                            controller: _stockController,
                            labelText: 'Stock',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        space16,
                        Expanded(
                          child: CompInputText(
                            controller: _priceController,
                            labelText: 'Precio',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CompDropdown(
                            items: ['UND', 'CAJA', 'PQT', 'BOlSA'],
                            controller: _unitController,
                            hintText: 'U.M',
                          ),
                        ),
                        space16,
                        Expanded(
                          child: CompInputText(
                            controller: _contentUnitController,
                            labelText: 'Contenido',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CompTextArea(
                            controller: _descriptionController,
                            labelText: 'Descripción',
                          ),
                        ),
                        CreateProductCamera(),
                      ],
                    ),
                    CompButton(
                      onPressed: () async {
                        await _saveProduct();
                      },
                      name: 'Guardar',
                    ),
                  ],
                ),
                gap8,
                ComDivider(),
                gap8,
                CreateProductCard(
                  columnList: [
                    CreateProductSectionTitle(title: 'Información adicional'),
                    gap8,
                    CompInputText(
                      controller: _brandController,
                      labelText: 'Marca',
                    ),
                    CompDropdown(
                      items: ['Electrónica', 'Ropa', 'Alimentos'],
                      hintText: 'Familia',
                      onChanged: (value) {},
                    ),
                    CompDropdown(
                      items: ['Electrónica', 'Ropa', 'Alimentos'],
                      hintText: 'Categoría',
                      onChanged: (value) {},
                    ),
                    CompInputText(
                      controller: _minStockController,
                      labelText: 'Stock mínimo',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                gap8,
                ComDivider(),
                gap8,
                CreateProductCard(
                  columnList: [
                    CreateProductSectionTitle(title: 'Atributos avanzados'),
                    CompInputText(
                      controller: _skuController,
                      labelText: 'SKU',
                    ),
                    CompInputText(
                      controller: _barcodeController,
                      labelText: 'Código de barras',
                    ),
                    CompInputText(
                      controller: _weightController,
                      labelText: 'Peso (Kg)',
                      keyboardType: TextInputType.number,
                    ),
                    CompInputText(
                      controller: _dimensionsController,
                      labelText: 'Dimensiones (Alto x Ancho x Profundidad)',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
