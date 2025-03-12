import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_ad.freezed.dart';
part 'video_ad.g.dart';

@freezed
class VideoAd with _$VideoAd {
  const factory VideoAd({
    required String id,
    required String title,
    required String description,
    required String category,
    required String videoUrl,
    required DateTime createdAt,
    required String client,
    required String campaign,
    required Duration duration,
  }) = _VideoAd;

  factory VideoAd.fromJson(Map<String, dynamic> json) =>
      _$VideoAdFromJson(json);
}
