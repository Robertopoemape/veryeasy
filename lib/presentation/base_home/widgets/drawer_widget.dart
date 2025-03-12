import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/base_home/providers/base_home_notifier.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../core/router/router_provider.gr.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  void _handleSignOut(BuildContext context, WidgetRef ref) {
    final baseHomeNotifier = ref.read(baseHomeNotifierProvider.notifier);
    compShowDialogMessage(
      context,
      isReturn: true,
      title: 'Cerrar Sesión',
      message: '¿Estás seguro que deseas cerrar sesión?',
      label: 'Si',
      onPressed: () {
        baseHomeNotifier.logout();
        autoRouterReplace(context, LoginRoute());
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nombre del Usuario'),
            accountEmail: const Text('usuario@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/png/user.png'),
            ),
            decoration: BoxDecoration(
              color: ComColors.primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              autoRouterReplace(context, BaseHomeRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_library),
            title: const Text('Videos'),
            onTap: () {
              Navigator.pop(context);
              autoRouterReplace(context, VideoAdsRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Productos'),
            onTap: () {
              Navigator.pop(context);
              autoRouterReplace(context, ProductRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Inventario'),
            onTap: () {
              Navigator.pop(context);
              autoRouterReplace(context, InventoryRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.smart_display),
            title: const Text('IA'),
            onTap: () {
              Navigator.pop(context);
              autoRouterReplace(context, GeneratorIARoute());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              autoRouterPush(context, SettingRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () => _handleSignOut(context, ref),
          ),
        ],
      ),
    );
  }
}
