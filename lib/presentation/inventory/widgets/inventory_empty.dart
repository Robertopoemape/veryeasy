/*import 'package:flutter/material.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class InventoryEmpty extends StatelessWidget {
  const InventoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ds16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.inventory,
              size: ds64,
              color: ComColors.black200,
            ),
            gap16,
            Text(
              'No hay productos en el inventario',
              style: ComTextStyle.h6.w500,
            ),
            gap16,
            CompButton(
              name: 'Agregar Producto',
              width: 160,
              onPressed: () {
                autoRouterPush(context, CreateProductRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
