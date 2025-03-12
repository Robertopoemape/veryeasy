import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../core/router/router_provider.gr.dart';
import '../../../src/services/auth/auth_service.dart';
import '../providers/home_notifier.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _handleSignOut(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    compShowDialogMessage(
      context,
      isReturn: true,
      title: 'Cerrar Sesión',
      message: '¿Estás seguro que deseas cerrar sesión?',
      label: 'Si',
      onPressed: () {
        authService.signOut();
        autoRouterReplace(context, LoginRoute());
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);
    final homeNotifier = ref.read(homeNotifierProvider.notifier);
    final currentIndex = homeState.currentIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ComColors.primaryColor,
        title: Text(
          homeNotifier.titles[currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _handleSignOut(context, ref),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: homeNotifier.screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: homeNotifier.setIndex,
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
