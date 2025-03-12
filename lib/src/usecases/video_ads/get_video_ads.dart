import 'package:veryeasy/core/exceptions/failure.dart';
import 'package:veryeasy/core/utils/methods/either.dart';

import '../../models/video_ad_model.dart';
import '../../repositories/video_ads/remote/video_ad_repository.dart';

class GetVideoAds {
  final VideoAdRemoteRepository repository;
  GetVideoAds(this.repository);

  Future<Either<Failure, List<VideoAdModel>>> call() async {
    return repository.getVideoAds();
  }
}
