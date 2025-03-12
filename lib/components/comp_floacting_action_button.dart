import 'package:flutter/material.dart';

import '../core/core.dart';

class CompFloactingActionButton extends StatelessWidget {
  const CompFloactingActionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: ComColors.primaryColor,
      backgroundColor: ComColors.green400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ds50),
      ),
      onPressed: onPressed,
      child: const Icon(Icons.refresh),
    );
  }
}
