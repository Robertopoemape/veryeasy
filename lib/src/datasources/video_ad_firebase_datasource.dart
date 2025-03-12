import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/video_ad_model.dart';

part 'video_ad_firebase_datasource.g.dart';

@riverpod
VideoAdFirebaseDatasource videoAdFirebaseDatasource(
  VideoAdFirebaseDatasourceRef ref,
) {
  return VideoAdFirebaseDatasource(FirebaseFirestore.instance);
}

class VideoAdFirebaseDatasource {
  final FirebaseFirestore firestore;

  VideoAdFirebaseDatasource(this.firestore);

  Future<List<VideoAdModel>> getVideoAds() async {
    final snapshot = await firestore.collection("video_ads").get();
    return snapshot.docs
        .map((doc) => VideoAdModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> uploadVideo(VideoAdModel videoAd) async {
    await firestore
        .collection("video_ads")
        .doc(videoAd.id)
        .set(videoAd.toJson());
  }
}
