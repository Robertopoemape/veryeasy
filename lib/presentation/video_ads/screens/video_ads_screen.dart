import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/components.dart';
import '../../../src/src.dart';
import '../providers/video_ad_notifier.dart';
import '../widgets/video_ads_empty.dart';
import '../widgets/video_grid.dart';

@RoutePage()
class VideoAdsScreen extends ConsumerWidget {
  const VideoAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAdsAsync = ref.watch(videoAdNotifierProvider);
    final video = ref.read(videoAdNotifierProvider.notifier);

    return Scaffold(
      body: _buildBody(context, videoAdsAsync, video),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'video_ads_fab',
        onPressed: () => video.refresh(),
      ),
    );
  }

  Widget _buildBody(BuildContext context,
      AsyncValue<List<VideoAd>> videoAdsAsync, VideoAdNotifier video) {
    return videoAdsAsync.when(
      data: (videos) => videos.isEmpty
          ? VideoAdsEmpty(
              context: context,
            )
          : VideoGrid(videos: videos),
      loading: () => CompLoading(),
      error: (error, _) => CompError(
          message: error.toString(), onPressed: () => video.refresh()),
    );
  }
}
