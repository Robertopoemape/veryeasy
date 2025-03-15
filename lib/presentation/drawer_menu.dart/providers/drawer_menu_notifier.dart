import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../base_home/providers/base_home_notifier.dart';
import 'drawer_menu_state.dart';

part 'drawer_menu_notifier.g.dart';

@riverpod
class DrawerMenuNotifier extends _$DrawerMenuNotifier {
  @override
  FutureOr<DrawerMenuState> build() {
    return DrawerMenuState();
  }

  void handleSignOut(BuildContext context, WidgetRef ref) {
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
}
