import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../src/entities/product.dart';
import 'product_state.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  final List<Product> _staticProducts = [
    Product(name: 'iPhone 14', price: 999, image: 'assets/img/png/not-img.png'),
    Product(
        name: 'MacBook Pro', price: 1999, image: 'assets/img/png/not-img.png'),
    Product(
        name: 'AirPods Pro', price: 249, image: 'assets/img/png/not-img.png'),
    Product(
        name: 'Mesa para laptop',
        price: 249,
        image: 'assets/img/png/not-img.png'),
    Product(
        name: 'Ventilador de 3 motores con resorte',
        price: 249,
        image: 'assets/img/png/not-img.png'),
  ];

  @override
  ProductState build() {
    return const ProductState.initial([]);
  }

  Future<void> fetchProducts() async {
    state = const ProductState.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = ProductState.loaded(_staticProducts);
    } catch (e) {
      state = ProductState.error(e.toString());
    }
  }
}
