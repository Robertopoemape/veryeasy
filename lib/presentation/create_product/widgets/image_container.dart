import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/create_product_notifier.dart';

class ImageContainer extends ConsumerWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProductNotifier = ref
        .watch(createProductNotifierProvider.select((state) => state.product));

    final isValidateImage = createProductNotifier.image?.isNotEmpty ?? false;

    return Column(
      children: [
        if (isValidateImage) ...[
          gap8,
          CompImageSvg(
            pathNetwork: createProductNotifier.image!,
            width: ds250,
            height: ds250,
            fit: BoxFit.cover,
          ),
          gap8,
        ],
      ],
    );
  }
}
