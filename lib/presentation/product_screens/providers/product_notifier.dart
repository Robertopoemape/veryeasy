import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../src/entities/product.dart';

class ProductNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final products = [
        Product(
            name: 'iPhone 14', price: 999, image: 'assets/img/png/not-img.png'),
        Product(
            name: 'MacBook Pro',
            price: 1999,
            image: 'assets/img/png/not-img.png'),
        Product(
            name: 'AirPods Pro',
            price: 249,
            image: 'assets/img/png/not-img.png'),
        Product(
            name: 'Mesa para laptop',
            price: 249,
            image: 'assets/img/png/not-img.png'),
        Product(
            name: 'ventilador de 3 motores con resorte',
            price: 249,
            image: 'assets/img/png/not-img.png'),
      ];
      state = AsyncData(products);
      return products;
    } catch (e) {
      state = AsyncError('Error al cargar los productos', StackTrace.current);
      return [];
    }
  }
}

final productProvider =
    AsyncNotifierProvider<ProductNotifier, List<Product>>(ProductNotifier.new);
