import 'package:flutter/material.dart';
import 'package:veryeasy/presentation/inventory/widgets/widgets.dart';

void filterShowOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return const InventoryFilterOptions();
    },
  );
}
