class VideoAd {
  final String id;
  final String title;
  final String description;
  final String category;
  final String videoUrl;
  final DateTime createdAt;
  final String client;
  final String campaign;
  final Duration duration;

  VideoAd({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.videoUrl,
    required this.createdAt,
    required this.client,
    required this.campaign,
    required this.duration,
  });
}
