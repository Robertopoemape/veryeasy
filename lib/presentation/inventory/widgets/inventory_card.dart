import 'package:flutter/material.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../core/core.dart';
import '../../../src/src.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({
    required this.context,
    required this.item,
    super.key,
  });

  final BuildContext context;
  final Product item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => autoRouterPush(context, ProductDetailRoute()),
      borderRadius: BorderRadius.circular(ds12),
      child: Container(
        margin: const EdgeInsets.only(bottom: ds12),
        padding: const EdgeInsets.all(ds12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ds12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(ds005),
              blurRadius: ds6,
              offset: const Offset(ds0, ds3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ds8),
              child: Image.network(
                item.image,
                width: ds60,
                height: ds60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: ds60,
                  height: ds60,
                  color: ComColors.black200,
                  child: const Center(
                    child: Icon(Icons.image_not_supported,
                        color: ComColors.red500),
                  ),
                ),
              ),
            ),
            space12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: ComTextStyle.button1,
                    maxLines: ints1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  gap4,
                  Text(
                    'Cantidad: ${item.stock}',
                    style: ComTextStyle.caption,
                  ),
                  gap4,
                  Text(
                    item.price.toString(),
                    style: ComTextStyle.button1.green500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
