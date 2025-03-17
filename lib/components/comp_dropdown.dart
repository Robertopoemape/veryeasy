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
  late Color borderColor;
  late TextEditingController internalController;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.bgcblack;
    internalController = widget.controller ?? TextEditingController();

    if (widget.initialValue != null &&
        widget.items.contains(widget.initialValue)) {
      internalController.text = widget.initialValue!;
      selectedValue = widget.initialValue;
      borderColor = ComColors.greenA100;
    }

    internalController.addListener(() {
      if (!mounted) return;
      setState(() {
        final text = internalController.text;
        selectedValue = widget.items.contains(text) ? text : null;
        borderColor = text.isEmpty ? ComColors.bgcblack : borderColor;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingContent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.messageLabel.isEmpty
              ? gap0
              : Padding(
                  padding: const EdgeInsets.only(bottom: ds2),
                  child: Row(
                    children: [
                      Text(
                        widget.messageLabel,
                        style: ComTextStyle.overline.black600,
                      ),
                      const Spacer(),
                      if (widget.isOptional)
                        Text(
                          '*Opcional',
                          style: ComTextStyle.overline.white800,
                        ),
                    ],
                  ),
                ),
          DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              labelStyle: ComTextStyle.caption.white800,
              contentPadding: const EdgeInsets.symmetric(horizontal: ds16),
              labelText: widget.label,
              enabledBorder: _borderStyle(),
              focusedBorder: _borderStyle(ds2),
              border: _borderStyle(),
            ),
            hint: Text(
              widget.hintText,
              style: ComTextStyle.caption.white800,
            ),
            icon: Icon(Icons.keyboard_arrow_down, size: ds20),
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: ComTextStyle.body2),
                    ))
                .toList(),
            onChanged: (value) {
              if (!mounted) return;
              setState(() {
                internalController.text = value ?? '';
                selectedValue = value;
                borderColor = ComColors.greenA100;
              });
              widget.onChanged?.call(value);
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _borderStyle([double width = ds1]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: width),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
  }
}
