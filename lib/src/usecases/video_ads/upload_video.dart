import '../../entities/video_ad.dart';
import '../../repositories/video_ads/remote/video_ad_repository.dart';

class UploadVideo {
  final VideoAdRemoteRepository _repository;
  UploadVideo(this._repository);

  Future<void> call(VideoAd videoAd) async {
    await _repository.uploadVideo(videoAd);
  }
}
