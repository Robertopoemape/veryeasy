import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/core.dart';
import '../providers/base_home_notifier.dart';
import '../widgets/drawer_widget.dart';

@RoutePage()
class BaseHomeScreen extends ConsumerWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    final currentIndex = baseHomeState.currentIndex;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: ComColors.primaryColor,
        title: Text(baseHomeNotifier.titles[currentIndex],
            style: ComTextStyle.title.w700),
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
        unselectedItemColor: ComColors.green400,
        selectedItemColor: ComColors.primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Productos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: 'Inventario'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_display), label: 'IA'),
        ],
      ),
    );
  }
}
