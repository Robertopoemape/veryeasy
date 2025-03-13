import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../src/entities/entities.dart';
import 'video_player.dart';

class VideoGrid extends StatelessWidget {
  const VideoGrid({
    required this.videos,
    super.key,
  });

  final List<VideoAd> videos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ints2,
        mainAxisSpacing: ds16,
        crossAxisSpacing: ds16,
        childAspectRatio: ds07,
      ),
      padding: const EdgeInsets.all(ds16),
      itemCount: videos.length,
      itemBuilder: (context, index) => VideoPlayer(
        context: context,
        video: videos[index],
      ),
    );
  }
}
