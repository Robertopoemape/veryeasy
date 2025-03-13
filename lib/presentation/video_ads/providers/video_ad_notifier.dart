import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../src/entities/video_ad.dart';
import '../../../src/models/video_ad_model.dart';
import '../../../src/repositories/video_ads/remote/video_ad_repository.dart';

part 'video_ad_notifier.g.dart';

@riverpod
class VideoAdNotifier extends _$VideoAdNotifier {
  @override
  Future<List<VideoAd>> build() async {
    final repository = ref.watch(videoAdRemoteRepositoryProvider);
    final result = await repository.getVideoAds();

    return result.when(
      left: (failure) => throw Exception(failure.message),
      right: (videos) => _mapToEntities(videos),
    );
  }

  List<VideoAd> _mapToEntities(List<VideoAdModel> models) {
    return models.map((video) => video.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final repository = ref.watch(videoAdRemoteRepositoryProvider);
      final result = await repository.getVideoAds();
      state = result.when(
        left: (failure) => AsyncError(failure.message!, StackTrace.current),
        right: (videos) => AsyncData(_mapToEntities(videos)),
      );
    } catch (e, st) {
      state = AsyncError(e.toString(), st);
    }
  }

  Future<void> launchVideoUrl(BuildContext context, String videoUrl) async {
    final url = Uri.tryParse(videoUrl);
    if (url == null || !await canLaunchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el video')),
      );
      return;
    }
    await launchUrl(url);
  }
}
