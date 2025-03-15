import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';
import '../../../core/core.dart';
import '../providers/inventory_notifier.dart';
import '../widgets/inventory_empty.dart';
import '../widgets/inventory_list.dart';

@RoutePage()
class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsync = ref.watch(inventoryNotifierProvider);

    return Scaffold(
      body: inventoryAsync.when(
        data: (state) {
          final products = state.products;
          if (products.isEmpty) {
            return InventoryEmpty();
          } else {
            return InventoryList(items: products);
          }
        },
        loading: () => CompLoading(),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'inventory_fab',
        widgetIcon: Icon(Icons.add_circle_outline_rounded),
        onPressed: () => autoRouterPush(context, CreateProductRoute()),
      ),
    );
  }
}
