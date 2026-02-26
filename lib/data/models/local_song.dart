import 'dart:typed_data';

class LocalSongModel {
  final int id;
  final String title;
  final String artist;
  final String uri;
  final String albumTitle;
  final int duration;

  // Lazy Initialize
  Uint8List? thumbnail;

  LocalSongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.uri,
    required this.albumTitle,
    required this.duration,
    this.thumbnail,
  });
}
