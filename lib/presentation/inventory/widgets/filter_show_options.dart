import 'package:flutter/material.dart';
import 'package:veryeasy/presentation/inventory/widgets/widgets.dart';

import '../../../core/core.dart';

void filterShowOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(ds20)),
    ),
    builder: (context) {
      return const InventoryFilterOptions();
    },
  );
}
