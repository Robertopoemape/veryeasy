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
  bool isLoading = false;

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
    final bool isDisabled = isLoading || widget.onPressed == null;

    return Container(
      padding: widget.paddingContent,
      height: widget.height,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isDisabled ? null : _handlePressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDisabled ? ComColors.grey500 : widget.backgroundColor,
          foregroundColor: isDisabled ? ComColors.grey200 : widget.textColor,
          shadowColor: isDisabled ? Colors.transparent : widget.backgroundColor,
          elevation: isDisabled ? ds0 : ds5,
          padding: const EdgeInsets.symmetric(horizontal: ds16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ds8),
            side: BorderSide(
              color: isDisabled ? ComColors.grey400 : widget.borderColor!,
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
                style: ComTextStyle.button1.w500.copyWith(
                    color: isDisabled ? ComColors.grey200 : widget.textColor),
              ),
      ),
    );
  }
}
