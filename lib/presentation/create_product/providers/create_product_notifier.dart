import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/src.dart';
import 'create_product_state.dart';

part 'create_product_notifier.g.dart';

@riverpod
class CreateProductNotifier extends _$CreateProductNotifier {
  late final TextEditingController nameController;
  late final TextEditingController stockController;
  late final TextEditingController priceController;
  late final TextEditingController unitMeasurement;
  late final TextEditingController contentUnitController;
  late final TextEditingController descriptionController;

  final ImagePicker _picker = ImagePicker();

  @override
  CreateProductState build() {
    nameController = TextEditingController();
    stockController = TextEditingController();
    priceController = TextEditingController();
    unitMeasurement = TextEditingController();
    contentUnitController = TextEditingController();
    descriptionController = TextEditingController();

    return CreateProductState(
      product: Product.empty(),
      isLoading: false,
      errorMessage: null,
    );
  }

  void updateField<T>({
    required String fieldName,
    required T value,
  }) {
    state = state.copyWith(
      product: state.product.copyWith(
        name: fieldName == 'name' ? value as String : state.product.name,
        stock: fieldName == 'stock' ? value as int : state.product.stock,
        price: fieldName == 'price' ? value as int : state.product.price,
        image: fieldName == 'image' ? value as String : state.product.image,
        description: fieldName == 'description'
            ? value as String
            : state.product.description,
        brand: fieldName == 'brand' ? value as String : state.product.brand,
        unitMeasurement: fieldName == 'unitMeasurement'
            ? value as String
            : state.product.unitMeasurement,
        contentUnit: fieldName == 'contentUnit'
            ? value as int
            : state.product.contentUnit,
        minStock:
            fieldName == 'minStock' ? value as int : state.product.minStock,
        sku: fieldName == 'sku' ? value as String : state.product.sku,
        barcode:
            fieldName == 'barcode' ? value as String : state.product.barcode,
        weight: fieldName == 'weight' ? value as double : state.product.weight,
        dimensions: fieldName == 'dimensions'
            ? value as String
            : state.product.dimensions,
      ),
    );
    final Map<String, void Function(String)> controllerMap = {
      'name': (text) => nameController.text = text,
      'stock': (text) => stockController.text = text,
      'price': (text) => priceController.text = text,
      'unitMeasurement': (text) => unitMeasurement.text = text,
      'contentUnit': (text) => contentUnitController.text = text,
      'description': (text) => descriptionController.text = text,
    };

    if (controllerMap.containsKey(fieldName)) {
      String formattedValue;
      switch (fieldName) {
        case 'stock':
        case 'contentUnit':
          formattedValue = value.toString();
          break;
        case 'price':
          formattedValue = value.toString();
          break;
        case 'name':
        case 'description':
        case 'unitMeasurement':
          formattedValue = value.toString();
        default:
          formattedValue = value.toString();
      }
      controllerMap[fieldName]!(formattedValue);
    }
  }

  Future<void> openGallery() async {
    try {
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 800,
        maxWidth: 800,
      );

      if (imageFile != null) {
        final base64Image = await uploadImageToFirestore(imageFile.path);
        if (base64Image != null) {
          updateField(fieldName: 'image', value: 'base64:$base64Image');
        } else {
          log('Error: No se pudo codificar la imagen.');
        }
      }
    } catch (e) {
      log('Error al abrir la galería: $e');
    }
  }

  Future<void> openCamera() async {
    try {
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 800,
        maxWidth: 800,
      );

      if (imageFile != null) {
        final base64Image = await uploadImageToFirestore(imageFile.path);
        if (base64Image != null) {
          updateField(fieldName: 'image', value: 'base64:$base64Image');
        } else {
          log('Error: No se pudo codificar la imagen.');
        }
      }
    } catch (e) {
      log('Error al abrir la cámara: $e');
    }
  }

  Future<void> saveProduct(BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      if (!state.product.isValid) {
        throw Exception('Los datos del producto no son válidos.');
      }

      final productId = await _saveProductToFirestore(state.product);

      _showSnackbar(context, 'Producto guardado con éxito (ID: $productId)');

      await Future.delayed(const Duration(milliseconds: 500));

      resetState();
    } catch (e) {
      log('Error al guardar el producto: $e');
      state = state.copyWith(errorMessage: e.toString());
      _showSnackbar(context, 'Error al guardar el producto: ${e.toString()}',
          isError: true);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String> _saveProductToFirestore(Product product) async {
    final firestore = FirebaseFirestore.instance;
    final productId = firestore.collection('products').doc().id;

    await firestore.collection('products').doc(productId).set(product.toJson());
    log('Producto guardado con ID: $productId');

    return productId;
  }

  void _showSnackbar(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<String?> uploadImageToFirestore(String filePath) async {
    try {
      final File file = File(filePath);
      if (!file.existsSync()) {
        log('Error: El archivo no existe en la ruta proporcionada.');
        return null;
      }

      final List<int> imageBytes = await file.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

      if (base64Image.length > 1000000) {
        log('Error: La imagen excede el límite de 1 MB.');
        return null;
      }

      log('Imagen codificada en Base64 exitosamente.');
      return base64Image;
    } catch (e) {
      log('Error al codificar la imagen: $e');
      return null;
    }
  }

  bool get isValid => state.product.isValid;

  void resetState() {
    state = CreateProductState(
      product: Product.empty(),
      isLoading: false,
      errorMessage: null,
    );

    nameController.clear();
    stockController.clear();
    priceController.clear();
    unitMeasurement.clear();
    contentUnitController.clear();
    descriptionController.clear();
  }
}
