import 'package:flutter/material.dart';
import 'package:veryeasy/presentation/inventory/widgets/widgets.dart';

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
    return ListView.builder(
      padding: const EdgeInsets.all(ds16),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          InventoryCard(context: context, item: items[index]),
    );
  }
}
