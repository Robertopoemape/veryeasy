import 'package:flutter/material.dart';

import '../core/core.dart';

class CompFloactingActionButton extends StatelessWidget {
  const CompFloactingActionButton(
      {required this.onPressed, this.heroTag, super.key});

  final VoidCallback onPressed;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: ComColors.primaryColor,
      backgroundColor: ComColors.green400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ds50),
      ),
      onPressed: onPressed,
      heroTag: heroTag,
      child: const Icon(Icons.refresh),
    );
  }
}
