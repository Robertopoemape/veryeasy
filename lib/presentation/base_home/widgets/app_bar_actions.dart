import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../inventory/providers/inventory_notifier.dart';
import '../providers/base_home_notifier.dart';

class AppBarActions extends ConsumerWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final currentIndex = baseHomeState.currentIndex;

    final isSearching = ref.watch(inventoryNotifierProvider
        .select((state) => state.value?.isSearching ?? false));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: getAppBarActions(context, currentIndex, isSearching, ref),
    );
  }

  List<Widget> getAppBarActions(
    BuildContext context,
    int currentIndex,
    bool isSearching,
    WidgetRef ref,
  ) {
    switch (currentIndex) {
      case 0: // Home
        return [];
      case 1: // Video
        return [
          _buildIconButton(Icons.add, () {
            Navigator.pushNamed(context, '/upload_video');
          }),
        ];
      case 2: // Products
        return [
          _buildIconButton(Icons.search, () {}),
          _buildIconButton(Icons.shopping_cart_checkout_sharp, () {}),
        ];
      case 3: // Inventory
        return [
          if (!isSearching) ...[
            _buildIconButton(
              Icons.search,
              () => ref
                  .read(inventoryNotifierProvider.notifier)
                  .setIsSearching(true),
            ),
            _buildIconButton(Icons.filter_list, () {}),
          ],
        ];
      case 4: // IA
        return [
          _buildIconButton(Icons.settings, () {}),
        ];
      default:
        return [];
    }
  }

  IconButton _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
