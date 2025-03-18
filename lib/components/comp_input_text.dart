import 'package:flutter/material.dart';

import '../core/core.dart';

class CompInputText extends StatefulWidget {
  const CompInputText({
    required this.labelText,
    this.controller,
    this.onChangedText,
    this.widthBorder = ds1,
    this.borderRadius = ds8,
    this.borderColor,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.initialValue,
    this.fontSize,
    this.obscureText = false,
    super.key,
  });

  final String labelText;
  final double? widthBorder;
  final double? borderRadius;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChangedText;
  final bool readOnly;
  final EdgeInsets paddingContent;
  final String? initialValue;
  final double? fontSize;
  final bool obscureText;

  @override
  State<CompInputText> createState() => _CompInputTextState();
}

class _CompInputTextState extends State<CompInputText> {
  late bool _isObscure;
  Color? borderColor;
  TextEditingController? internalController;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.black500;
    internalController = widget.controller ?? TextEditingController();
    _isObscure = widget.obscureText;
    internalController!.addListener(() {
      if (mounted) {
        setState(() {
          if (internalController!.text.isEmpty) {
            borderColor = ComColors.black500;
          }
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
      padding: widget.paddingContent,
      child: TextFormField(
        controller: widget.controller,
        style: ComTextStyle.body3.w400.white1000
            .copyWith(fontSize: widget.fontSize),
        obscureText: _isObscure,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: ComTextStyle.caption.white800,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: widget.widthBorder!,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: ds2,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: widget.widthBorder!,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: ds16,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: ComColors.black500,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
        ),
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              borderColor = ComColors.green500;
            } else {
              borderColor = ComColors.red500;
            }
          });
          if (widget.onChangedText != null) widget.onChangedText!(value);
        },
      ),
    );
  }
}
