import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';
import '../../../core/core.dart';

class InventorySearchProduct extends ConsumerWidget {
  const InventorySearchProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryNotifierProvider);
    final inventoryNotifier = ref.read(inventoryNotifierProvider.notifier);

    final isSearching = inventoryState.value?.isSearching ?? false;
    final isLoading = inventoryState.value?.isLoading ?? false;
    final searchController = inventoryNotifier.searchController;

    return AnimatedContainer(
      duration: const Duration(milliseconds: ints300),
      height: ds30,
      width: isSearching ? MediaQuery.of(context).size.width * ds085 : ds0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ds30),
        boxShadow: [
          BoxShadow(
            color: ComColors.bgcblack.withOpacity(ds06),
            blurRadius: ds8,
            spreadRadius: ds2,
          ),
        ],
      ),
      child: isSearching
          ? TextField(
              cursorColor: ComColors.black1000,
              cursorHeight: ds15,
              controller: searchController,
              autofocus: true,
              style: ComTextStyle.body2,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: isLoading
                    ? CompLoading(
                        height: ds20,
                        width: ds20,
                        style: LoadingAlignment.right,
                      )
                    : InkWell(
                        onTap: () => inventoryNotifier.setIsSearching(false),
                        child:
                            Icon(Icons.close, size: ds24, color: Colors.grey),
                      ),
                hintText: 'Buscar producto...',
                hintStyle: ComTextStyle.body2,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: ds9, horizontal: ds16),
              ),
              onChanged: (query) {
                inventoryNotifier.search(query);
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
