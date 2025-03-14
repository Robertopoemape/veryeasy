import 'package:flutter/material.dart';

import '../core/core.dart';

class CompFloactingActionButton extends StatelessWidget {
  const CompFloactingActionButton({
    required this.onPressed,
    required this.heroTag,
    this.widgetIcon = const Icon(Icons.refresh),
    super.key,
  });

  final VoidCallback onPressed;
  final Object heroTag;
  final Widget widgetIcon;

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
      child: widgetIcon,
    );
  }
}
