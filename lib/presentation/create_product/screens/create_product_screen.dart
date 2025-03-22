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
    final isLoading = ref.watch(createProductNotifierProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Producto', style: ComTextStyle.h6),
        centerTitle: true,
        backgroundColor: ComColors.primaryColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(ds16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap8,
                ExpandableSection(
                  title: 'Datos principales',
                  isExpanded: true,
                  child: MainDataProduct(),
                ),
                gap8,
                ComDivider(),
                gap8,
                ExpandableSection(
                  title: 'Información Adicional',
                  child: AdditionalInfoProduct(),
                ),
                gap8,
                ComDivider(),
                gap8,
                ExpandableSection(
                  title: 'Atributos Avanzados',
                  child: AdvancedAttributesProduct(),
                ),
              ],
            ),
          ),
          if (isLoading) const Center(child: CompLoading()),
        ],
      ),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
    this.isExpanded = false,
  });
  final String title;
  final Widget child;
  final bool isExpanded;

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: ds8, horizontal: ds16),
            decoration: BoxDecoration(
              color: ComColors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(ds8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: ComTextStyle.body1,
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: ComColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(top: ds8),
                  child: widget.child,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
