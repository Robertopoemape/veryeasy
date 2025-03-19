import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required String id,
    required String name,
    required int stock,
    required double price,
    required String image,
    required String description,
    required String brand,
    required int contentUnit,
    required String unitMeasurement,
    required int minStock,
    required String sku,
    required String barcode,
    required double weight,
    required String dimensions,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => Product(
        id: '',
        name: '',
        stock: 0,
        price: 0.0,
        image: '',
        description: '',
        brand: '',
        contentUnit: 0,
        unitMeasurement: '',
        minStock: 0,
        sku: '',
        barcode: '',
        weight: 0.0,
        dimensions: '',
      );

  bool get isValid {
    return name.isNotEmpty &&
        stock > 0 &&
        price > 0 &&
        unitMeasurement.isNotEmpty &&
        contentUnit > 0 &&
        description.isNotEmpty &&
        image.isNotEmpty;
  }
}
