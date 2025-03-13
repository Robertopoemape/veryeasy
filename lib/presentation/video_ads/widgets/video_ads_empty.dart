import 'package:flutter/material.dart';
import 'package:veryeasy/components/components.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../core/core.dart';

class VideoAdsEmpty extends StatelessWidget {
  const VideoAdsEmpty({
    required this.context,
    super.key,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.video_library,
              size: ds64, color: ComColors.black200),
          gap16,
          Text(
            'No hay anuncios disponibles',
            style: ComTextStyle.h6.w500,
          ),
          gap16,
          CompButton(
            name: 'Subir anuncio',
            onPressed: () => autoRouterPush(context, UploadVideoRoute()),
          ),
        ],
      ),
    );
  }
}
