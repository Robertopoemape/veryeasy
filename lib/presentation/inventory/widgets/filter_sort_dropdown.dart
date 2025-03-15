import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class FilterSortDropdown extends ConsumerWidget {
  const FilterSortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortOptions =
        ref.watch(inventoryNotifierProvider.notifier).sortOptions;
    final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);

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
          onChanged: (sortBy) {
            if (sortBy != null) {
              final ascending =
                  ref.watch(inventoryNotifierProvider).value!.tempAscending;
              inventoryNotifier.setTempSortOptions(sortBy, ascending!);
            }
          },
        ),
      ],
    );
  }
}
