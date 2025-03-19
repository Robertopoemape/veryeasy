import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/src.dart';
import 'create_product_state.dart';

part 'create_product_notifier.g.dart';

@riverpod
class CreateProductNotifier extends _$CreateProductNotifier {
  final ImagePicker _picker = ImagePicker();

  @override
  CreateProductState build() {
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
        price: fieldName == 'price' ? value as double : state.product.price,
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
  }

  Future<void> openGallery() async {
    try {
      final XFile? imageFile =
          await _picker.pickImage(source: ImageSource.gallery);
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
      final XFile? imageFile =
          await _picker.pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        final base64Image = await uploadImageToFirestore(imageFile.path);
        if (base64Image != null) {
          updateField(fieldName: 'image', value: 'base64:$base64Image');
        }
      }
    } catch (e) {
      log('Error al abrir la cámara: $e');
    }
  }

  Future<void> saveProduct() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      await FirebaseFirestore.instance
          .collection('products')
          .add(state.product.toJson());
      resetState();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String?> uploadImageToFirestore(String filePath) async {
    try {
      final File file = File(filePath);
      if (!file.existsSync()) {
        log('Error: El archivo no existe en la ruta proporcionada.');
        return null;
      }

      // Leer el archivo como bytes y codificarlo en Base64
      final List<int> imageBytes = await file.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

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
  }
}
