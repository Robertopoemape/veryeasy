import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/src.dart';

part 'create_product_notifier.g.dart';

@riverpod
class CreateProductNotifier extends _$CreateProductNotifier {
  final ImagePicker _picker = ImagePicker();

  @override
  Product build() {
    return Product.empty();
  }

  void updateField<T>({
    required String fieldName,
    required T value,
  }) {
    state = state.copyWith(
      name: fieldName == 'name' ? value as String : state.name,
      stock: fieldName == 'stock' ? value as int : state.stock,
      price: fieldName == 'price' ? value as double : state.price,
      image: fieldName == 'image' ? value as String : state.image,
      description:
          fieldName == 'description' ? value as String : state.description,
      brand: fieldName == 'brand' ? value as String : state.brand,
      unitMeasurement: fieldName == 'unitMeasurement'
          ? value as String
          : state.unitMeasurement,
      contentUnit:
          fieldName == 'contentUnit' ? value as int : state.contentUnit,
      minStock: fieldName == 'minStock' ? value as int : state.minStock,
      sku: fieldName == 'sku' ? value as String : state.sku,
      barcode: fieldName == 'barcode' ? value as String : state.barcode,
      weight: fieldName == 'weight' ? value as double : state.weight,
      dimensions:
          fieldName == 'dimensions' ? value as String : state.dimensions,
    );
  }

  Future<void> openGallery() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      updateField(fieldName: 'image', value: imageFile.path);
    }
  }

  Future<void> openCamera() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      updateField(fieldName: 'image', value: imageFile.path);
    }
  }

  Future<void> saveProduct() async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .add(state.toJson());
      resetState();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  bool get isValid =>
      state.name.isNotEmpty &&
      state.stock > 0 &&
      state.price > 0 &&
      state.unitMeasurement.isNotEmpty &&
      state.contentUnit > 0 &&
      state.description.isNotEmpty &&
      state.image.isNotEmpty;

  void resetState() {
    state = Product.empty();
  }
}
