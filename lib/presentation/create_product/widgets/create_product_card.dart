import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CreateProductCard extends StatelessWidget {
  const CreateProductCard({
    required this.columnList,
    super.key,
  });

  final List<Widget> columnList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ds4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ds16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          children: columnList,
        ),
      ),
    );
  }
}
