import 'package:flutter/material.dart';

import '../core/core.dart';

class CompSubtitle extends StatelessWidget {
  const CompSubtitle({
    required this.title,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: ds16),
    super.key,
  });

  final String title;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: Text(
        title,
        style: ComTextStyle.h6,
      ),
    );
  }
}
