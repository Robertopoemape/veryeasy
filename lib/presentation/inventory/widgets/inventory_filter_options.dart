import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';
import 'package:veryeasy/presentation/inventory/widgets/order_switch.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class InventoryFilterOptions extends ConsumerWidget {
  const InventoryFilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(ds16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompSubtitle(
            contentPadding: EdgeInsets.zero,
            title: 'Filtrar y Ordenar',
          ),
          gap16,
          FilterSortDropdown(),
          gap16,
          OrderSwitch(),
          gap24,
          CompButton(
              name: 'Aplicar filtro',
              borderColor: ComColors.greenA100,
              backgroundColor: ComColors.greenA100,
              onPressed: () {
                inventoryNotifier.applyFilter(context);
              }),
        ],
      ),
    );
  }
}
