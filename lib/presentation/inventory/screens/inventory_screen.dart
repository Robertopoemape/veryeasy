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
      // appBar: _buildAppBar(context),
      body: _buildBody(context, inventoryAsync),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'inventory_fab',
        widgetIcon: Icon(Icons.add_circle_outline_rounded),
        onPressed: () => autoRouterPush(context, CreateProductRoute()),
      ),
    );
  }

/*
  /// AppBar personalizado con título y acciones
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Inventario'),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _showSearchDialog(context),
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => _showFilterOptions(context),
        ),
      ],
    );
  }*/

  Widget _buildBody(BuildContext context,
      AsyncValue<List<Map<String, dynamic>>> inventoryAsync) {
    return inventoryAsync.when(
      data: (items) =>
          items.isEmpty ? InventoryEmpty() : InventoryList(items: items),
      loading: () => CompLoading(),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
