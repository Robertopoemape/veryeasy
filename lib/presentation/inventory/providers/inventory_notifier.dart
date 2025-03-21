import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_state.dart';

import '../../../core/core.dart';
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
    state = const AsyncValue.data(InventoryState(isSearching: false));
    final products = await _fetchProducts();
    return InventoryState(products: products, allProducts: products);
  }

  void toggleSearch() {
    state = AsyncValue.data(
      state.value!.copyWith(isSearching: !state.value!.isSearching),
    );
  }

  void search(String query) {
    _debounce?.cancel();
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
    _debounce = Timer(const Duration(milliseconds: 500), () {
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
    if (state.value == null) {
      return;
    }

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
      final data = await _fetchProducts();

      final sortedProducts = _sortProducts(
        data,
        state.value?.sortBy,
        state.value!.ascending,
      );

      state = AsyncValue.data(
        InventoryState(
          products: sortedProducts,
          allProducts: data,
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Product>> _fetchProducts() async {
    /* await Future.delayed(const Duration(seconds: 2));
    return [
      Product(
        name: 'Producto A',
        stock: 10,
        price: 19,
        image: 'assets/img/png/not-img.png',
        description: 'Descripción del Producto A',
        brand: '',
        contentUnit: 0,
        unitMeasurement: '',
        minStock: 0,
        sku: '',
        barcode: '',
        weight: 0,
        dimensions: '',
      ),
      Product(
        name: 'Producto B',
        stock: 5,
        price: 29,
        image: 'assets/img/png/not-img.png',
        description: 'Descripción del Producto B',
        brand: '',
        contentUnit: 0,
        unitMeasurement: '',
        minStock: 0,
        sku: '',
        barcode: '',
        weight: 0,
        dimensions: '',
      ),
      Product(
        name: 'Producto C',
        stock: 20,
        price: 9,
        image: 'assets/img/png/not-img.png',
        description: 'Descripción del Producto C',
        brand: '',
        contentUnit: 0,
        unitMeasurement: '',
        minStock: 0,
        sku: '',
        barcode: '',
        weight: 0,
        dimensions: '',
      ),
    ];*/
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      final products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Product.fromJson(data);
      }).toList();

      state =
          AsyncValue.data(InventoryState(products: products, isLoading: false));
      return products;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  final List<String> sortOptions = [
    'Nombre',
    'Cantidad',
    'Precio',
  ];

  void applySort(String sortBy, bool ascending) {
    final sortedProducts =
        _sortProducts(state.value!.allProducts, sortBy, ascending);
    state = AsyncValue.data(
      state.value!.copyWith(
        sortBy: sortBy,
        ascending: ascending,
        products: sortedProducts,
      ),
    );
  }

  List<Product> _sortProducts(
    List<Product> products,
    String? sortBy,
    bool ascending,
  ) {
    if (sortBy == null) return products;

    int compare(Product a, Product b) {
      switch (sortBy) {
        case 'Nombre':
          return a.name.compareTo(b.name);
        case 'Cantidad':
          return a.stock.compareTo(b.stock);
        case 'Precio':
          return a.price.compareTo(b.price);
        default:
          return 0;
      }
    }

    final sortedList = [...products]..sort(compare);
    return ascending ? sortedList : sortedList.reversed.toList();
  }

  void setTempSortOptions(String sortBy, bool ascending) {
    state = AsyncValue.data(
      state.value!.copyWith(
        tempSortBy: sortBy,
        tempAscending: ascending,
      ),
    );
  }

  void applyFilter(BuildContext context) {
    final currentState = state.value!;
    if (currentState.tempSortBy == null || currentState.tempSortBy!.isEmpty) {
      autoRouterPop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selecciona un criterio de ordenamiento',
            style: TextStyle(color: Theme.of(context).colorScheme.onError),
          ),
          backgroundColor: ComColors.oran500,
        ),
      );
      return;
    }

    final sortedProducts = _sortProducts(
      currentState.allProducts,
      currentState.tempSortBy!,
      currentState.tempAscending!,
    );

    state = AsyncValue.data(
      currentState.copyWith(
        sortBy: currentState.tempSortBy!,
        ascending: currentState.tempAscending!,
        products: sortedProducts,
      ),
    );

    autoRouterPop(context);
  }
}
