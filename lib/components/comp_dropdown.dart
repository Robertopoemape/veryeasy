import 'package:flutter/material.dart';

import '../core/core.dart';

class CompDropdown extends StatefulWidget {
  const CompDropdown({
    required this.items,
    this.borderColor,
    this.label = '',
    this.messageLabel = '',
    this.widthBorder = ds1,
    this.hintText = 'Selecciona una opción',
    this.borderRadius = ds8,
    this.isOptional = false,
    this.onChanged,
    this.initialValue,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.controller,
    super.key,
  });

  final List<String> items;
  final String? label;
  final Color? borderColor;
  final double widthBorder;
  final String messageLabel;
  final String hintText;
  final double borderRadius;
  final bool isOptional;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;
  final EdgeInsets paddingContent;
  final TextEditingController? controller;

  @override
  State<CompDropdown> createState() => _DropdownState();
}

class _DropdownState extends State<CompDropdown> {
  Color? borderColor;
  String? selectedValue;
  TextEditingController? internalController;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.bgcblack;

    internalController = widget.controller ?? TextEditingController();

    internalController!.addListener(
      () {
        if (mounted) {
          setState(() {
            if (internalController!.text.isEmpty) {
              borderColor = ComColors.bgcblack;
            } else {
              selectedValue = internalController!.text.isNotEmpty &&
                      widget.items.contains(internalController!.text)
                  ? internalController!.text
                  : null;
            }
          });
        }
      },
    );

    if (internalController!.text.isNotEmpty) {
      selectedValue = widget.items.contains(internalController!.text)
          ? internalController!.text
          : null;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      internalController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingContent,
      child: DropdownButtonFormField<String>(
        value:
            internalController!.text.isEmpty ? null : internalController!.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: ds16),
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: widget.widthBorder,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: ds2,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: widget.widthBorder,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        hint: Text(
          widget.hintText,
          style: ComTextStyle.body2,
        ),
        icon: Icon(Icons.keyboard_arrow_down, size: ds20),
        items: widget.items.map((method) {
          return DropdownMenuItem<String>(
            value: method,
            child: Text(
              method,
              style: ComTextStyle.body2,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (mounted) {
            setState(() {
              internalController!.text = value ?? '';
              selectedValue = value;
              borderColor = ComColors.greenA100;
            });
            widget.onChanged?.call(value);
          }
        },
      ),
    );
  }
}
