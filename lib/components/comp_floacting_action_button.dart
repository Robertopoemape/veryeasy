import 'package:flutter/material.dart';

import '../core/core.dart';

class CompFloactingActionButton extends StatelessWidget {
  const CompFloactingActionButton({
    required this.onPressed,
    this.widget = const Icon(Icons.refresh),
    this.heroTag,
    super.key,
  });

  final VoidCallback onPressed;
  final Object? heroTag;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: ComColors.primaryColor,
      backgroundColor: ComColors.green600,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ds50),
      ),
      onPressed: onPressed,
      heroTag: heroTag,
      child: widget,
    );
  }
}
