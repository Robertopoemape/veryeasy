import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/create_product_notifier.dart';
import '../widgets/widgets.dart';

@RoutePage()
class CreateProductScreen extends ConsumerWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.read(createProductNotifierProvider).isLoading;

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Registro de Producto', style: ComTextStyle.h6),
          centerTitle: true,
          backgroundColor: ComColors.primaryColor,
        ),
        body: CompLoading(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Producto', style: ComTextStyle.h6),
        centerTitle: true,
        backgroundColor: ComColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainDataProduct(),
            gap8,
            ComDivider(),
            gap8,
            AdditionalIntoProduct(),
            gap8,
            ComDivider(),
            gap8,
            AdvancedAttributesProduct(),
          ],
        ),
      ),
    );
  }
}
