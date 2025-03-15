import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../src/src.dart';
import 'inventory_card.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({
    required this.items,
    super.key,
  });
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(ds16),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          InventoryCard(context: context, item: items[index]),
    );
  }
}
