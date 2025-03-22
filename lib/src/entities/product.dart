import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required String name,
    required int stock,
    required int price,
    String? image,
    String? description,
    String? family,
    String? brand,
    String? category,
    required int contentUnit,
    String? unitMeasurement,
    required int minStock,
    String? sku,
    String? barcode,
    required double weight,
    String? dimensions,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => Product(
        name: '',
        stock: 0,
        price: 0,
        image: null,
        description: null,
        brand: null,
        family: null,
        category: null,
        contentUnit: 0,
        unitMeasurement: null,
        minStock: 0,
        sku: null,
        barcode: null,
        weight: 0.0,
        dimensions: null,
      );

  bool get isValid {
    return name.isNotEmpty &&
        stock > 0 &&
        price > 0 &&
        (unitMeasurement?.isNotEmpty ?? false) &&
        contentUnit > 0 &&
        (description?.isNotEmpty ?? false) &&
        (image?.isNotEmpty ?? false);
  }
}
