import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';
import 'package:veryeasy/presentation/drawer_menu.dart/providers/drawer_menu_notifier.dart';

import '../../../core/core.dart';

class DrawerMenuScreen extends ConsumerWidget {
  const DrawerMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeNotifier = ref.read(drawerMenuNotifierProvider.notifier);

    return Drawer(
      backgroundColor: ComColors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ComColors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(ds16),
                bottomRight: Radius.circular(ds16),
              ),
            ),
            accountName:
                Text('Nombre del Usuario', style: ComTextStyle.h6.w800),
            accountEmail: Text(
              'usuario@example.com',
              style: ComTextStyle.subtitle2.white.w500,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: ComColors.white,
              radius: ds30,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/png/user.png'),
                radius: ds28,
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.create),
            title: Text(
              'Registro',
              style: ComTextStyle.body1.w600.copyWith(
                color: ComColors.primaryColor,
              ),
            ),
            iconColor: ComColors.primaryColor,
            collapsedIconColor: ComColors.primaryColor,
            childrenPadding: const EdgeInsets.symmetric(horizontal: ds16),
            children: [
              _buildDrawerItem(
                icon: Icons.video_library,
                text: 'Crear video',
                onTap: () {
                  autoRouterPop(context);
                  autoRouterPush(context, CreateVideoIARoute());
                },
              ),
              _buildDrawerItem(
                icon: Icons.store,
                text: 'Crear Producto',
                onTap: () {
                  autoRouterPop(context);
                  autoRouterPush(context, CreateProductRoute());
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text(
              "Reportes",
              style: ComTextStyle.body1.w600.copyWith(
                color: ComColors.primaryColor,
              ),
            ),
            iconColor: ComColors.primaryColor,
            collapsedIconColor: ComColors.primaryColor,
            childrenPadding: const EdgeInsets.symmetric(horizontal: ds16),
            children: [
              _buildDrawerItem(
                icon: Icons.analytics,
                text: 'Reporte de ventas',
                onTap: () {
                  autoRouterPop(context);
                  //  autoRouterPush(context, ProductSavedRoute(product: null));
                },
              ),
              _buildDrawerItem(
                icon: Icons.article,
                text: 'Proformas',
                onTap: () {
                  autoRouterPop(context);
                  autoRouterPush(context, GeneratorIARoute());
                },
              ),
            ],
          ),

          // Configuración
          _buildDrawerItem(
            icon: Icons.settings,
            text: 'Configuración',
            onTap: () {
              autoRouterPop(context);
              autoRouterPush(context, SettingRoute());
            },
          ),

          ListTile(
            leading: Icon(
              Icons.logout,
              color: ComColors.bgcblack,
            ),
            title: Text(
              'Cerrar Sesión',
              style: ComTextStyle.body1.w600,
            ),
            onTap: () => baseHomeNotifier.handleSignOut(context, ref),
          ),
        ],
      ),
    );
  }

  /// Método auxiliar para construir items del drawer con un diseño consistente
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: ComColors.primaryColor, // Color primario para los íconos
      ),
      title: Text(
        text,
        style: ComTextStyle.body1.w600.copyWith(
          color: ComColors.primaryColor,
        ),
      ),
      onTap: onTap,

      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16), // Espaciado horizontal
    );
  }
}
