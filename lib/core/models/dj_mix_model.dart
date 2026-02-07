class DJMixModel {
  final dynamic id;
  final String title;
  final String podcastArtist;
  final String link;
  final String photo;
  final String thumbnail;
  final String photoPlayer;
  final String likes;
  final String plays;
  final double duration;

  DJMixModel({
    required this.id,
    required this.title,
    required this.podcastArtist,
    required this.link,
    required this.photo,
    required this.thumbnail,
    required this.photoPlayer,
    required this.likes,
    required this.plays,
    required this.duration,
  });

  /// Factory constructor to create DJMixModel from JSON
  factory DJMixModel.fromJson(Map<String, dynamic> json) {
    return DJMixModel(
      id: json['id'],
      title: json['title'] as String? ?? '',
      podcastArtist: json['podcast_artist'] as String? ?? '',
      link: json['link'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      photoPlayer: json['photo_player'] as String? ?? '',
      likes: json['likes'] as String? ?? '0',
      plays: json['plays'] as String? ?? '0',
      duration: (json['duration'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Convert DJMixModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'podcast_artist': podcastArtist,
      'link': link,
      'photo': photo,
      'thumbnail': thumbnail,
      'photo_player': photoPlayer,
      'likes': likes,
      'plays': plays,
      'duration': duration,
    };
  }
}
