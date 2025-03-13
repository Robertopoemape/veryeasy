import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SubtitleCategory extends StatelessWidget {
  const SubtitleCategory({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ds16),
      child: Text(
        title,
        style: ComTextStyle.h6,
      ),
    );
  }
}
