import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../providers/base_home_notifier.dart';

class BottomNavigationBarList extends ConsumerWidget {
  const BottomNavigationBarList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    final currentIndex = baseHomeState.currentIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: baseHomeNotifier.setIndex,
      unselectedItemColor: ComColors.green600,
      selectedItemColor: ComColors.primaryColor,
      items: const [
        BottomNavigationBarItem(
          tooltip: 'Inicio',
          icon: Icon(Icons.dashboard),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          tooltip: 'Videos',
          icon: Icon(Icons.video_library),
          label: 'Videos',
        ),
        BottomNavigationBarItem(
          tooltip: 'Productos',
          icon: Icon(Icons.store),
          label: 'Productos',
        ),
        BottomNavigationBarItem(
          tooltip: 'Inventario',
          icon: Icon(Icons.inventory),
          label: 'Inventario',
        ),
        BottomNavigationBarItem(
          tooltip: 'IA',
          icon: Icon(Icons.smart_display),
          label: 'IA',
        ),
      ],
    );
  }
}
