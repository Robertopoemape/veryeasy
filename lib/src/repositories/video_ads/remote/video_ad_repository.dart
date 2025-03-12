import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/core/exceptions/failure.dart';
import 'package:veryeasy/core/utils/methods/either.dart';
import 'package:veryeasy/src/services/video_ads/video_ads_service.dart';
import '../../../../core/decorator/decorator_firebase.dart';
import '../../../entities/video_ad.dart';
import '../../../models/video_ad_model.dart';

part 'video_ad_repository.g.dart';

abstract class VideoAdRemoteRepository {
  Future<Either<Failure, List<VideoAdModel>>> getVideoAds();
  Future<void> uploadVideo(VideoAd videoAd);
}

@riverpod
VideoAdRemoteRepository videoAdRemoteRepository(
  VideoAdRemoteRepositoryRef ref,
) {
  final videoAdRemoteService = ref.watch(videoAdRemoteServiceProvider);
  return VideoAdRemoteRepositoryImpl(videoAdRemoteService);
}

class VideoAdRemoteRepositoryImpl implements VideoAdRemoteRepository {
  VideoAdRemoteRepositoryImpl(this._videoAdRemoteService);
  final VideoAdsRemoteService _videoAdRemoteService;

  @override
  Future<Either<Failure, List<VideoAdModel>>> getVideoAds() =>
      firebaseFutureDecorator(
        () => _videoAdRemoteService.getVideoAds(),
      );

  @override
  Future<void> uploadVideo(VideoAd videoAd) =>
      firebaseFutureDecorator(() => _videoAdRemoteService.uploadVideo(videoAd));
}
