import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/presentation/product/providers/product_state.dart';

import '../../../src/src.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  FutureOr<ProductState> build() async {
    final products = await fetchProducts();
    return ProductState(products: products);
  }

  final List<Product> staticProducts = [
    Product(
        id: '1',
        name: 'iPhone 14',
        quantity: 2,
        price: 999,
        image: 'assets/img/png/not-img.png',
        description: 'Este es un nuevo producto'),
    Product(
        id: '2',
        name: 'MacBook Pro',
        quantity: 10,
        price: 1999,
        image: 'assets/img/png/not-img.png',
        description: 'Este es un nuevo producto'),
    Product(
        id: '3',
        name: 'AirPods Pro',
        quantity: 20,
        price: 249,
        image: 'assets/img/png/not-img.png',
        description: 'Este es un nuevo producto'),
    Product(
        id: '4',
        name: 'Mesa para laptop',
        quantity: 50,
        price: 249,
        image: 'assets/img/png/not-img.png',
        description: 'Este es un nuevo producto'),
    Product(
        id: '4',
        name: 'Ventilador de 3 motores con resorte',
        quantity: 100,
        price: 249,
        image: 'assets/img/png/not-img.png',
        description: 'Este es un nuevo producto'),
  ];

  Future<void> refresh() async {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncValue.data(
          ProductState(products: staticProducts, isLoading: false));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Product>> fetchProducts() async {
    state = AsyncValue.loading();

    try {
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncValue.data(ProductState(products: staticProducts));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }

    return state.value!.products;
  }
}
