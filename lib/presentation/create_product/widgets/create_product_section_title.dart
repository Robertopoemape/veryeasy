import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CreateProductSectionTitle extends StatelessWidget {
  const CreateProductSectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: ComTextStyle.title.w800,
      ),
    );
  }
}
