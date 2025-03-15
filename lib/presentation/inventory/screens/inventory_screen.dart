import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';
import '../../../core/core.dart';
import '../providers/inventory_notifier.dart';
import '../widgets/widgets.dart';

@RoutePage()
class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList =
        ref.watch(inventoryNotifierProvider).value?.products ?? [];
    final inventoryAsync = ref.watch(inventoryNotifierProvider);

    return Scaffold(
      body: inventoryAsync.when(
        data: (list) => InventoryList(items: list.products),
        /*{
          final products = state.products;
          if (products.isEmpty) {
            return CompListEmpty(
              icon: Icons.store,
              label: 'Productos',
              onPressed: () {
                autoRouterPush(context, CreateProductRoute());
              },
            );
          } else {
            return InventoryList(items: products);
          }
        },*/
        loading: () => CompLoading(),
        error: (error, _) => CompError(
          message: e.toString(),
          onPressed: () async =>
              await ref.read(inventoryNotifierProvider.notifier).refresh(),
        ),
      ),
      floatingActionButton: productsList.isEmpty
          ? null
          : CompFloactingActionButton(
              heroTag: 'inventory_fab',
              widgetIcon: Icon(Icons.add),
              onPressed: () => autoRouterPush(context, CreateProductRoute()),
            ),
    );
  }
}
