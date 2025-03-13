import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/video_ads/providers/video_ad_notifier.dart';

import '../../../core/core.dart';
import '../../../src/entities/entities.dart';

class VideoPlayer extends ConsumerWidget {
  const VideoPlayer({
    required this.context,
    required this.video,
    super.key,
  });

  final BuildContext context;
  final VideoAd video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAdsNotifier = ref.read(videoAdNotifierProvider.notifier);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ds12)),
      child: InkWell(
        onTap: () => videoAdsNotifier.launchVideoUrl(context, video.videoUrl),
        borderRadius: BorderRadius.circular(ds12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(ds12)),
              child: Image.network(
                video.videoUrl,
                height: ds150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: ds150,
                  color: ComColors.black200,
                  child: const Center(
                      child: Icon(Icons.error, color: ComColors.red500)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(ds12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(video.title,
                      maxLines: ints1,
                      overflow: TextOverflow.ellipsis,
                      style: ComTextStyle.body2.w600),
                  gap4,
                  Text(
                    video.description,
                    maxLines: ints2,
                    overflow: TextOverflow.ellipsis,
                    style: ComTextStyle.caption.black300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
