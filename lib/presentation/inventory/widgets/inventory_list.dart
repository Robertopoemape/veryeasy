import 'package:flutter/material.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';
import 'package:veryeasy/presentation/inventory/widgets/widgets.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/src.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({
    required this.items,
    super.key,
  });
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? CompListEmpty(
            icon: Icons.store,
            label: 'Productos',
            onPressed: () {
              autoRouterPush(context, CreateProductRoute());
            },
          )
        : ListView.builder(
            padding: const EdgeInsets.all(ds16),
            itemCount: items.length,
            itemBuilder: (context, index) =>
                InventoryCard(context: context, item: items[index]),
          );
  }
}
