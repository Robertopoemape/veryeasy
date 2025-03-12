import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/comp_show_dialog_message.dart';

import '../../../core/core.dart';
import '../../../core/router/router.dart';
import '../../../core/router/router_provider.gr.dart';
import '../../../src/services/auth/auth_service.dart';
import '../../generator_ia/screens/generator_ia_screen.dart';
import '../../product_screens/screen/product_screen.dart';
import '../../video_ads/screens/video_ads_screen.dart';
import '../providers/home_notifier.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final selectedIndex = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    final List<String> titles = [
      'Inicio',
      'Videos',
      'Productos',
      'Inventario',
      'Generador de IA'
    ];

    final List<Widget> screens = [
      const Center(child: Text('Inicio')),
      const VideoAdsScreen(),
      const ProductScreen(),
      const Center(child: Text('Inventario')),
      const GeneratorIAScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ComColors.primaryColor,
        title: Text(
          titles[selectedIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              compShowDialogMessage(
                context,
                isReturn: true,
                title: 'Cerrar Sesión',
                message: '¿Estas seguro que desea cerrar sesión?',
                label: 'Si',
                onPressed: () {
                  authService.signOut();
                  autoRouterReplace(context, LoginRoute());
                },
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => homeNotifier.setIndex(index),
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
