import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../src/entities/product.dart';
import 'product_state.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  ProductState build() {
    return const ProductState.initial([]);
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

  Future<void> fetchProducts() async {
    state = const ProductState.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = ProductState.loaded(staticProducts);
    } catch (e) {
      state = ProductState.error(e.toString());
    }
  }
}
