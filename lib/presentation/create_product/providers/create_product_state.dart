import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../src/entities/entities.dart';

part 'create_product_state.freezed.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    required Product product,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _CreateProductState;
}
