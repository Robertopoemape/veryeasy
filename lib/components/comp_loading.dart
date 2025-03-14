import 'package:flutter/material.dart';

import '../core/core.dart';

enum LoadingAlignment {
  centered,
  right,
}

class CompLoading extends StatefulWidget {
  const CompLoading({
    this.color,
    this.height = ds24,
    this.width = ds24,
    this.alignment = Alignment.center,
    this.style = LoadingAlignment.centered,
    super.key,
  });

  final double height;
  final double width;
  final LoadingAlignment style;
  final Alignment alignment;
  final Color? color;

  @override
  CompLoadingState createState() => CompLoadingState();
}

class CompLoadingState extends State<CompLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: ints2),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: widget.color ?? const Color.fromARGB(255, 83, 231, 60),
      end: widget.color ?? ComColors.primaryColor,
    ).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoadingAlignment loadingAlignment = widget.style;
    return _buildLoadingWidget(loadingAlignment);
  }

  Widget _buildLoadingWidget(LoadingAlignment loadingAlignment) {
    switch (loadingAlignment) {
      case LoadingAlignment.centered:
        return Center(
          child: CircularProgressIndicator(
              strokeWidth: ds3, valueColor: _colorAnimation),
        );

      case LoadingAlignment.right:
        return Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: ds10),
          height: widget.height,
          width: widget.width,
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: CircularProgressIndicator(
                strokeWidth: ds3, valueColor: _colorAnimation),
          ),
        );
    }
  }
}
