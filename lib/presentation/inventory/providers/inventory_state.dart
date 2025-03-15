import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../src/entities/product.dart';

part 'inventory_state.freezed.dart';
part 'inventory_state.g.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default([]) List<Product> products,
    @Default([]) List<Product> allProducts,
    @Default(false) bool isSearching,
    @Default(false) bool isLoading,
    @Default(null) String? sortBy,
    @Default(false) bool ascending,
    bool? tempAscending,
    String? tempSortBy,
  }) = _InventoryState;

  factory InventoryState.fromJson(Map<String, dynamic> json) =>
      _$InventoryStateFromJson(json);
}
