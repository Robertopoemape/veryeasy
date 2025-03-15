import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';

import '../../../core/core.dart';

class OrderSwitch extends ConsumerWidget {
  const OrderSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryNotifierProvider).value!;
    final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);
    final tempAscending =
        inventoryState.tempAscending ?? inventoryState.ascending;
    final sortBy = inventoryState.tempSortBy ?? inventoryState.sortBy;
    return Row(
      children: [
        Expanded(
          child: Text(
            'De ${tempAscending ? "menor a mayor" : "mayor a menor"}',
            style: ComTextStyle.button1.w500.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        AnimatedRotation(
          turns: tempAscending ? ds0 : ds05,
          duration: const Duration(milliseconds: ints200),
          child: Icon(
            Icons.arrow_downward,
            color: tempAscending ? ComColors.greenA100 : ComColors.grey300,
            size: ds24,
          ),
        ),
        Switch(
          value: tempAscending,
          onChanged: (ascending) {
            inventoryNotifier.setTempSortOptions(sortBy!, ascending);
          },
          activeColor: ComColors.greenA100,
          activeTrackColor: ComColors.greenA100.withOpacity(ds04),
          inactiveThumbColor: ComColors.grey300,
          inactiveTrackColor: ComColors.grey300.withOpacity(ds04),
        ),
      ],
    );
  }
}
