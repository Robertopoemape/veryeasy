import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/base_home/providers/base_home_notifier.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';

import '../../../core/core.dart';
import '../../inventory/widgets/widgets.dart';

class BaseHomeTitleAnimation extends ConsumerWidget {
  const BaseHomeTitleAnimation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iventoryState = ref.watch(inventoryNotifierProvider).value!;
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    final isSearching = iventoryState.isSearching;
    final currentIndex = baseHomeState.currentIndex;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: ints300),
      child: isSearching
          ? InventorySearchProduct()
          : Text(baseHomeNotifier.titles[currentIndex],
              style: ComTextStyle.title.w700),
    );
  }
}
