import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/video_ad.dart';

part 'video_ad_model.freezed.dart';
part 'video_ad_model.g.dart';

@freezed
class VideoAdModel with _$VideoAdModel {
  const factory VideoAdModel({
    required String id,
    required String title,
    required String description,
    required String category,
    required String videoUrl,
    required DateTime createdAt,
    required String client,
    required String campaign,
    required int duration,
  }) = _VideoAdModel;

  factory VideoAdModel.fromJson(Map<String, dynamic> json) =>
      _$VideoAdModelFromJson(json);
}

extension VideoAdModelX on VideoAdModel {
  VideoAd toEntity() {
    return VideoAd(
      id: id,
      title: title,
      description: description,
      category: category,
      videoUrl: videoUrl,
      createdAt: createdAt,
      client: client,
      campaign: campaign,
      duration: Duration(seconds: duration),
    );
  }

  static VideoAdModel fromEntity(VideoAd entity) {
    return VideoAdModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      videoUrl: entity.videoUrl,
      createdAt: entity.createdAt,
      client: entity.client,
      campaign: entity.campaign,
      duration: entity.duration.inSeconds,
    );
  }
}
