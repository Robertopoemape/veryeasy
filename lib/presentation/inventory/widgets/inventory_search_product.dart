import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/presentation/base_home/providers/base_home_notifier.dart';
import 'package:veryeasy/presentation/inventory/providers/inventory_notifier.dart';
import '../../../core/core.dart';

class InventorySearchProduct extends ConsumerStatefulWidget {
  const InventorySearchProduct({super.key});

  @override
  InventorySearchProductState createState() => InventorySearchProductState();
}

class InventorySearchProductState
    extends ConsumerState<InventorySearchProduct> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    //   final inventorySearch = ref.read(inventoryNotifierProvider.notifier);
    //  final inventoryNotifier = ref.watch(inventoryNotifierProvider.notifier);
    final baseHomeSearch = ref.read(baseHomeNotifierProvider.notifier);
    final baseHomeNotifier = ref.watch(baseHomeNotifierProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(seconds: ints300),
      height: ds30,
      width: baseHomeNotifier.isSearching
          ? MediaQuery.of(context).size.width * ds085
          : ds0,
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
      child: baseHomeNotifier.isSearching
          ? TextField(
              cursorColor: ComColors.black1000,
              cursorHeight: ds15,
              controller: baseHomeNotifier.searchController,
              autofocus: true,
              style: ComTextStyle.body2,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: baseHomeNotifier.isLoading
                    ? CompLoading(
                        height: ds20,
                        width: ds20,
                        style: LoadingAlignment.right,
                      )
                    : InkWell(
                        onTap: () => baseHomeSearch.toggleSearch(),
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
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: ints500), () {
                  baseHomeSearch.search(query);
                });
              },
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
