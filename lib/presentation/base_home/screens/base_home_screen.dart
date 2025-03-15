import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/core.dart';
import '../providers/base_home_notifier.dart';
import '../widgets/bottom_navigation_bar_list.dart';
import '../widgets/widgets.dart';

@RoutePage()
class BaseHomeScreen extends ConsumerWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeState = ref.watch(baseHomeNotifierProvider);
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    final currentIndex = baseHomeState.currentIndex;

    return Scaffold(
      drawer: BaseHomeDrawer(),
      appBar: AppBar(
        backgroundColor: ComColors.primaryColor,
        title: BaseHomeTitleAnimation(),
        centerTitle: true,
        leading: BaseHomeOpenMenu(),
        actions: const [
          AppBarActions(),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: baseHomeNotifier.screens,
      ),
      bottomNavigationBar: BottomNavigationBarList(),
    );
  }
}
