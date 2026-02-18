class PlaylistModel {
  final String id;
  final String title;
  final int itemsCount;
  final int followers;
  final String photo;
  final String thumbnail;
  final String photoPlayer;
  final String caption;

  PlaylistModel({
    required this.id,
    required this.title,
    required this.itemsCount,
    required this.followers,
    required this.photo,
    required this.thumbnail,
    required this.photoPlayer,
    required this.caption,
  });

  /// Factory constructor to create PlaylistModel from JSON
  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      itemsCount: json['items_count'] as int? ?? 0,
      followers: json['followers'] as int? ?? 0,
      photo: json['photo'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      photoPlayer: json['photo_player'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
    );
  }

  /// Convert PlaylistModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'items_count': itemsCount,
      'followers': followers,
      'photo': photo,
      'thumbnail': thumbnail,
      'photo_player': photoPlayer,
      'caption': caption,
    };
  }
}
