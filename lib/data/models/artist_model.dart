class ArtistModel {
  final String name;
  final String photo;
  final String thumbnail;
  final String itemSubtitle;

  ArtistModel({
    required this.name,
    required this.photo,
    required this.thumbnail,
    required this.itemSubtitle,
  });

  /// Factory constructor to create ArtistModel from JSON
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      name: json['name'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      itemSubtitle: json['item_subtitle'] as String? ?? '',
    );
  }

  /// Convert ArtistModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'thumbnail': thumbnail,
      'item_subtitle': itemSubtitle,
    };
  }
}
