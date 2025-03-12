import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../entities/video_ad.dart';
import '../../datasources/video_ad_firebase_datasource.dart';
import '../../models/video_ad_model.dart';

part 'video_ads_service.g.dart';

abstract class VideoAdsRemoteService {
  Future<List<VideoAdModel>> getVideoAds();
  Future<void> uploadVideo(VideoAd videoAd);
}

@riverpod
VideoAdsRemoteService videoAdRemoteService(Ref ref) {
  return VideoAdRemoteServiceImpl(ref.watch(videoAdFirebaseDatasourceProvider));
}

class VideoAdRemoteServiceImpl implements VideoAdsRemoteService {
  final VideoAdFirebaseDatasource datasource;

  VideoAdRemoteServiceImpl(this.datasource);

  @override
  Future<List<VideoAdModel>> getVideoAds() async {
    try {
      final result = await datasource.getVideoAds();

      return result;
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> uploadVideo(VideoAd videoAd) async {
    try {
      final videoAdModel = VideoAdModelX.fromEntity(videoAd);

      await datasource.uploadVideo(videoAdModel);
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
