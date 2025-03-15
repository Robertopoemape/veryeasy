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

    return Row(
      children: [
        Expanded(
          child: Text(
            'Orden ${tempAscending ? "Ascendente" : "Descendente"}',
            style: ComTextStyle.button1.w500.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        AnimatedRotation(
          turns: tempAscending ? 0 : 0.5,
          duration: const Duration(milliseconds: ints200),
          child: Icon(
            Icons.arrow_downward,
            color: tempAscending ? ComColors.greenA100 : ComColors.gray300,
            size: ds24,
          ),
        ),
        Switch(
          value: tempAscending,
          onChanged: (value) {
            final sortBy = inventoryState.sortBy;
            inventoryNotifier.setTempSortOptions(sortBy, value);
          },
          activeColor: ComColors.greenA100,
          activeTrackColor: ComColors.greenA100.withOpacity(0.4),
          inactiveThumbColor: ComColors.gray300,
          inactiveTrackColor: ComColors.gray300.withOpacity(0.4),
        ),
      ],
    );
  }
}
