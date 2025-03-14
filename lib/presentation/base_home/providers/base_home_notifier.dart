import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/presentation/base_home/providers/base_home_state.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';
import 'package:veryeasy/presentation/inventory/screens/inventory_screen.dart';
import '../../../core/core.dart';
import '../../../core/router/router_provider.gr.dart';
import '../../../src/services/auth/auth_service.dart';

import '../../generator_ia/screens/generator_ia_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../product/screen/product_screen.dart';
import '../../video_ads/screens/video_ads_screen.dart';

part 'base_home_notifier.g.dart';

@riverpod
class BaseHomeNotifier extends _$BaseHomeNotifier {
  @override
  BaseHomeState build() {
    return const BaseHomeState(currentIndex: 0);
  }

  final TextEditingController searchController = TextEditingController();

  bool isSearching = false;
  bool isLoading = false;

  final List<String> titles = [
    'Inicio',
    'Videos',
    'Productos',
    'Inventario',
    'Generador de IA',
  ];

  final List<Widget> screens = [
    HomeScreen(),
    VideoAdsScreen(),
    ProductScreen(),
    InventoryScreen(),
    GeneratorIAScreen(),
  ];

  List<List<Widget>> appBarActions(BuildContext context) => [
        // Home
        [],
        // Video
        [
          IconButton(
            onPressed: () => autoRouterPush(
              context,
              UploadVideoRoute(),
            ),
            icon: Icon(Icons.add),
          ),
        ],
        // Products
        [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_checkout_sharp),
          ),
        ],
        // Inventory
        [
          if (!isSearching)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: toggleSearch,
            ),
          if (!isSearching)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            ),
        ],
        // IA
        [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ];

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) searchController.clear();
    state = state.copyWith();
  }

  void search(String query) {
    isLoading = true;
    state = state.copyWith();

    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
      state = state.copyWith();
    });
  }

  void clearSearch() {
    searchController.clear();
    toggleSearch();
  }

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    authService.signOut();
  }
}
