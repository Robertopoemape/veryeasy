import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> refresh() async {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      final products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Product.fromJson(data);
      }).toList();

      state =
          AsyncValue.data(ProductState(products: products, isLoading: false));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Product>> fetchProducts() async {
    state = AsyncValue.loading();

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      final products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Product.fromJson(data);
      }).toList();

      state =
          AsyncValue.data(ProductState(products: products, isLoading: false));

      return products;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}
