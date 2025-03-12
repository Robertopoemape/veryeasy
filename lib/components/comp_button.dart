import 'package:flutter/material.dart';

import '../core/core.dart';

class CompButton extends StatefulWidget {
  const CompButton({
    super.key,
    this.onPressed,
    this.height,
    this.width,
    this.name = 'Aceptar',
    this.backgroundColor = ComColors.green500,
    this.textColor = ComColors.white,
    this.paddingContent = const EdgeInsets.symmetric(vertical: ds8),
    this.borderColor = ComColors.green500,
  });

  final Function()? onPressed;
  final String name;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets paddingContent;
  final Color? borderColor;

  @override
  CompButtonState createState() => CompButtonState();
}

class CompButtonState extends State<CompButton> {
  Color? borderColor;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    borderColor = widget.borderColor ?? ComColors.black500;
  }

  void _handlePressed() async {
    if (widget.onPressed != null) {
      setState(() {
        isLoading = true;
      });
      await widget.onPressed!();
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.paddingContent,
        height: widget.height,
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: isLoading ? null : _handlePressed,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: widget.backgroundColor,
            backgroundColor: widget.backgroundColor ?? Colors.transparent,
            shadowColor: widget.backgroundColor == Colors.transparent
                ? Colors.transparent
                : widget.backgroundColor,
            elevation: widget.backgroundColor == Colors.transparent ? ds0 : ds5,
            padding: const EdgeInsets.symmetric(horizontal: ds16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ds8),
              side: BorderSide(
                color: borderColor!,
                width: 1.5,
              ),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: ds20,
                  height: ds20,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ComColors.white),
                    strokeWidth: ds2,
                  ),
                )
              : Text(
                  widget.name,
                  style: ComTextStyle.button1.w500
                      .copyWith(color: widget.textColor),
                ),
        ));
  }
}
