import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/components/components.dart';

import '../core/core.dart';

class CompError extends ConsumerWidget {
  const CompError({
    required this.message,
    required this.onPressed,
    super.key,
  });

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, textAlign: TextAlign.center),
          gap12,
          CompButton(
            name: 'Reintentar',
            onPressed: onPressed,
            width: ds150,
          ),
        ],
      ),
    );
  }
}
