import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/src.dart';

part 'inventory_notifier.g.dart';

@riverpod
class InventoryNotifier extends _$InventoryNotifier {
  late final TextEditingController searchController;
  Timer? _debounce;

  @override
  FutureOr<InventoryState> build() async {
    searchController = TextEditingController();
    ref.onDispose(() {
      _debounce?.cancel();
      searchController.dispose();
    });
    return InventoryState(products: await _loadProducts());
  }

  void toggleSearch() {
    state = AsyncValue.data(
      state.value!.copyWith(isSearching: !state.value!.isSearching),
    );
  }

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      state = AsyncValue.data(state.value!.copyWith(isLoading: true));
      final filteredList = state.value!.allProducts.where((product) {
        final name = product.name.toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
      state = AsyncValue.data(state.value!.copyWith(
        products: filteredList,
        isLoading: false,
      ));
    });
  }

  void setIsSearching(bool value) {
    if (!value) {
      searchController.clear();

      state = AsyncValue.data(
        state.value!.copyWith(
          products: state.value!.allProducts,
          isSearching: false,
          isLoading: false,
        ),
      );
    } else {
      state = AsyncValue.data(state.value!.copyWith(isSearching: true));
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await _loadProducts();
      state =
          AsyncValue.data(InventoryState(products: data, allProducts: data));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Product>> _loadProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Product(
        id: '1',
        name: 'Producto A',
        quantity: 10,
        price: 19.99,
        image: 'https://via.placeholder.com/100',
        description: 'Descripción del Producto A',
      ),
      Product(
        id: '2',
        name: 'Producto B',
        quantity: 5,
        price: 29.99,
        image: 'https://via.placeholder.com/100',
        description: 'Descripción del Producto B',
      ),
      Product(
        id: '3',
        name: 'Producto C',
        quantity: 20,
        price: 9.99,
        image: 'https://via.placeholder.com/100',
        description: 'Descripción del Producto C',
      ),
    ];
  }
}

class InventoryState {
  final List<Product> products;
  final List<Product> allProducts;
  final bool isSearching;
  final bool isLoading;

  InventoryState({
    this.products = const [],
    this.allProducts = const [],
    this.isSearching = false,
    this.isLoading = false,
  });

  InventoryState copyWith({
    List<Product>? products,
    List<Product>? allProducts,
    bool? isSearching,
    bool? isLoading,
  }) {
    return InventoryState(
      products: products ?? this.products,
      allProducts: allProducts ?? this.allProducts,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
