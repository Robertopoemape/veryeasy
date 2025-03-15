import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class FilterSortDropdown extends ConsumerWidget {
  const FilterSortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryNotifierProvider).value!;
    final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);
    final sortOptions = inventoryNotifier.sortOptions;
    final tempAscending =
        inventoryState.tempAscending ?? inventoryState.ascending;
    final tempSortBy = inventoryState.tempSortBy ?? inventoryState.sortBy;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ordenar por:',
          style: ComTextStyle.body1.w700,
        ),
        gap8,
        CompDropdown(
          borderRadius: ds12,
          items: sortOptions,
          initialValue: tempSortBy,
          onChanged: (sortBy) {
            if (sortBy != null) {
              inventoryNotifier.setTempSortOptions(sortBy, tempAscending);
            }
          },
        ),
      ],
    );
  }
}
