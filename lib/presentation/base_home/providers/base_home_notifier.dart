import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/presentation/base_home/providers/base_home_state.dart';
import 'package:veryeasy/presentation/inventory/screens/inventory_screen.dart';
import '../../../core/core.dart';
import '../../../core/router/router_provider.gr.dart';
import '../../../src/services/auth/auth_service.dart';

import '../../generator_ia/screens/generator_ia_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../product_screens/screen/product_screen.dart';
import '../../video_ads/screens/video_ads_screen.dart';

part 'base_home_notifier.g.dart';

@riverpod
class BaseHomeNotifier extends _$BaseHomeNotifier {
  @override
  BaseHomeState build() {
    return const BaseHomeState(currentIndex: 0);
  }

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
        [],
        [
          IconButton(
            onPressed: () => autoRouterPush(
              context,
              UploadVideoRoute(),
            ),
            icon: Icon(Icons.add),
          ),
        ],
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
        [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
        [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ];

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    authService.signOut();
  }
}
