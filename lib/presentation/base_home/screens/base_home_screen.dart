import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/inventory/widgets/inventory_filter_options.dart';
import '../../../core/core.dart';
import '../../inventory/providers/inventory_notifier.dart';
import '../../inventory/widgets/inventory_search_product.dart';
import '../providers/base_home_notifier.dart';
import '../widgets/app_bar_actions.dart';
import '../widgets/drawer_widget.dart';

@RoutePage()
class BaseHomeScreen extends ConsumerWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    // final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);
    final currentIndex = baseHomeState.currentIndex;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: ComColors.primaryColor,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: ints300),
          child: baseHomeNotifier.isSearching
              ? InventorySearchProduct()
              : Text(baseHomeNotifier.titles[currentIndex],
                  style: ComTextStyle.title.w700),
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu),
          );
        }),
        actions: [
          ...baseHomeNotifier.appBarActions(context)[currentIndex],
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: baseHomeNotifier.screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              label: 'Productos'),
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
      ),
    );
  }
}
