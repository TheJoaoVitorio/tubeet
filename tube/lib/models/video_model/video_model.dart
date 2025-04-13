class VideoModel {
  String id;
  String title;
  String channelId;
  String channelTitle;
  String thumbnail;
  String description;
  String viewCount;
  String likeCount;
  String publishedAt;

  VideoModel({
    required this.id,
    required this.title,
    required this.channelId,
    required this.channelTitle,
    required this.thumbnail,
    required this.description,
    required this.viewCount,
    required this.likeCount,
    required this.publishedAt,
  });

  // Construtor nomeado para criar a partir de um Map (ex.: JSON)
  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id']['videoId'] ?? '',
      title: map['snippet']['title'] ?? '',
      channelId: map['snippet']['channelId'] ?? '',
      channelTitle: map['snippet']['channelTitle'] ?? '',
      thumbnail: map['snippet']['thumbnail']['high']['url'] ?? '',
      description: map['snippet']['description'] ?? '',
      viewCount: map['viewCount'] ?? '0',
      likeCount: map['likeCount'] ?? '0',
      publishedAt: map['publishedAt'] ?? '',
    );
  }

}