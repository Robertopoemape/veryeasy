import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/create_product/providers/create_product_notifier.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class CreateProductCamera extends ConsumerWidget {
  const CreateProductCamera({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProductNotifier =
        ref.watch(createProductNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: ds16),
      child: SizedBox(
        height: ds48,
        width: ds50,
        child: ElevatedButton(
          onPressed: () {
            showDialogSelected(
              context: context,
              onTapGalery: () {
                createProductNotifier.openGallery();
                autoRouterPop(context);
              },
              onTapCamera: () {
                createProductNotifier.openCamera();
                autoRouterPop(context);
              },
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: ds5,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ds25),
            ),
          ),
          child: Icon(
            Icons.camera_alt,
            color: ComColors.black500,
            size: ds24,
          ),
        ),
      ),
    );
  }
}
