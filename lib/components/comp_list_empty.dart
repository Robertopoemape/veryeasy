import 'package:flutter/material.dart';
import 'package:veryeasy/components/components.dart';

import '../core/core.dart';

class CompListEmpty extends StatelessWidget {
  const CompListEmpty({
    required this.icon,
    required this.onPressed,
    this.label = 'Agregar',
    super.key,
  });

  final String? label;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: ds64,
          color: ComColors.black200,
        ),
        gap16,
        Center(
          child: Text(
            'No hay $label disponibles',
            style: ComTextStyle.h6.w500,
          ),
        ),
        gap16,
        CompButton(
          name: 'Agregar $label',
          width: 160,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
