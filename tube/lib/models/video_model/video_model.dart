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
    this.id = '',
    this.title = '',
    this.channelId = '',
    this.channelTitle = '',
    this.thumbnail = '',
    this.description = '',
    this.viewCount = '0',
    this.likeCount = '0',
    this.publishedAt = '',
  });

  // Construtor nomeado para criar a partir de um Map (ex.: JSON)
  factory VideoModel.fromMap(Map<String, dynamic> map) {

    final videoId = map['id'] is String ? map['id'] : 
                   map['id'] is Map ? map['id']['videoId'] ?? '' : '';
    
    return VideoModel(
      // id: map['id'] is String ? map['id'] : map['id']['videoId'],
      id: videoId,
      title: map['snippet']['title'] ?? '',
      channelId: map['snippet']['channelId'] ?? '',
      channelTitle: map['snippet']['channelTitle'] ?? '',
      thumbnail: map['snippet']['thumbnails']['high']['url'] ?? '',
      description: map['snippet']['description'] ?? '',
      viewCount: map['statistics']?['viewCount'] ?? '0',
      likeCount: map['statistics']?['likeCount'] ?? '0',
      publishedAt: map['snippet']['publishedAt'] ?? '',
    );
  }
}
