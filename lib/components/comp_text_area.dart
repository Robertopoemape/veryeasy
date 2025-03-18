import 'package:flutter/material.dart';

import '../core/core.dart';

class CompTextArea extends StatefulWidget {
  const CompTextArea({
    super.key,
    required this.labelText,
    this.controller,
    this.maxLines = ints8,
    this.minLines = ints1,
    this.borderColor,
    this.borderRadius = ds8,
    this.widthBorder = ds1,
    this.onChanged,
    this.padding = EdgeInsets.zero,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String? labelText;
  final int maxLines;
  final int minLines;
  final Color? borderColor;
  final double borderRadius;
  final double? widthBorder;
  final Function(String)? onChanged;
  final String? initialValue;
  final EdgeInsets padding;

  @override
  State<CompTextArea> createState() => _CompTextAreaState();
}

class _CompTextAreaState extends State<CompTextArea> {
  Color? borderColor;
  TextEditingController? internalController;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.black500;
    internalController = widget.controller ?? TextEditingController();

    internalController!.addListener(() {
      if (mounted) {
        setState(() {
          if (widget.initialValue != null) {
            internalController!.text = widget.initialValue!;
          }
        });
      }
    });
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
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap8,
          TextFormField(
            controller: widget.controller,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: ComTextStyle.caption.white800,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor!,
                  width: widget.widthBorder!,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor!,
                  width: widget.widthBorder!,
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: ds16, vertical: ds8),
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  borderColor = ComColors.greenA100;
                } else {
                  borderColor = ComColors.red500;
                }
              });
              if (widget.onChanged != null) widget.onChanged!(value);
            },
          ),
          gap8,
        ],
      ),
    );
  }
}
