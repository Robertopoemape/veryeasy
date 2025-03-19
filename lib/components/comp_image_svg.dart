import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';
import 'package:uuid/uuid.dart';

import '../core/core.dart';

enum ImgTypeData {
  imgSVG,
  imgFile,
  imgLoading,
  imgLocalSVG,
  imgLocalPNG,
  imgBase64,
}

class CompImageSvg extends StatefulWidget {
  const CompImageSvg({
    required this.pathNetwork,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String pathNetwork;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BoxFit fit;

  @override
  State<CompImageSvg> createState() => _CompImageSvgState();
}

class _CompImageSvgState extends State<CompImageSvg> {
  ImgTypeData imgTypeData = ImgTypeData.imgLoading;
  String key = '';

  void redirectionImage() {
    var uuiD = Uuid().v4();
    key = '$uuiD${widget.pathNetwork}';

    if (widget.pathNetwork.startsWith('base64:')) {
      imgTypeData = ImgTypeData.imgBase64;
    } else if (widget.pathNetwork.contains('http')) {
      imgTypeData = widget.pathNetwork.contains('.svg')
          ? ImgTypeData.imgSVG
          : ImgTypeData.imgFile;
    } else {
      imgTypeData = widget.pathNetwork.contains('.svg')
          ? ImgTypeData.imgLocalSVG
          : ['.png', '.jpg', '.jpeg'].any(widget.pathNetwork.contains)
              ? ImgTypeData.imgLocalPNG
              : ImgTypeData.imgLoading;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      redirectionImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (imgTypeData) {
      case ImgTypeData.imgLocalPNG:
        return _buildImageWithPlaceholder(
          child: Image.asset(
            widget.pathNetwork,
            key: ValueKey(key),
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            color: widget.color,
            errorBuilder: (context, error, stackTrace) => _crearWidgetError(),
          ),
        );

      case ImgTypeData.imgBase64:
        return _buildImageWithPlaceholder(
          child: Image.memory(
            base64Decode(widget.pathNetwork.replaceFirst('base64:', '')),
            key: ValueKey(key),
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            color: widget.color,
            errorBuilder: (context, error, stackTrace) => _crearWidgetError(),
          ),
        );

      case ImgTypeData.imgLocalSVG:
        return _buildImageWithPlaceholder(
          child: SvgPicture.asset(
            widget.pathNetwork,
            key: ValueKey(key),
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            colorFilter: ColorFilter.mode(
                widget.color ?? ComColors.bgcblack, BlendMode.srcIn),
            placeholderBuilder: (BuildContext context) => _crearSkeleton(),
          ),
        );

      case ImgTypeData.imgFile:
        return _buildImageWithPlaceholder(
          child: CachedNetworkImage(
            key: ValueKey(key),
            imageUrl: widget.pathNetwork,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            color: widget.color,
            placeholder: (context, url) => _crearSkeleton(),
            errorWidget: (context, url, error) => _crearWidgetError(),
          ),
        );

      case ImgTypeData.imgSVG:
        return _buildImageWithPlaceholder(
          child: CachedNetworkSVGImage(
            key: ValueKey(key),
            widget.pathNetwork,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            colorFilter: ColorFilter.mode(
                widget.color ?? ComColors.bgcblack, BlendMode.srcIn),
            placeholder: _crearSkeleton(),
            errorWidget: _crearWidgetError(),
          ),
        );

      default:
        return _buildErrorOrLoading();
    }
  }

  Widget _buildImageWithPlaceholder({required Widget child}) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: AnimatedOpacity(
        opacity: ds1,
        duration: const Duration(seconds: ints1),
        curve: Curves.easeOut,
        child: child,
      ),
    );
  }

  Widget _buildErrorOrLoading() {
    return Center(
      child: widget.pathNetwork.contains('background')
          ? CircularProgressIndicator(color: Colors.transparent)
          : _crearSkeleton(),
    );
  }

  Widget _crearSkeleton() {
    return Skeleton(
      isLoading: true,
      skeleton: SkeletonAvatar(
        style: SkeletonAvatarStyle(
          shape: BoxShape.rectangle,
          height: widget.height,
          width: widget.width,
          maxHeight: ds370,
          maxWidth: ds300,
          padding:
              EdgeInsets.all((widget.height ?? ds0) >= ints300 ? ds0 : ds4),
          borderRadius: BorderRadius.circular(ds16),
        ),
      ),
      child: const SizedBox.shrink(),
    );
  }

  Widget _crearWidgetError() {
    Future.delayed(const Duration(seconds: ints2), () {
      if (mounted) {
        setState(() {});
      }
    });
    return _crearSkeleton();
  }
}
