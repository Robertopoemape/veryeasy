import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../src/entities/product.dart';

part 'product_state.freezed.dart';
part 'product_state.g.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<Product> products,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);
}
