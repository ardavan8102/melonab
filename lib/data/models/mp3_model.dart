class Mp3File {
  final int id; // اضافه شده
  final String title;
  final String? artist;
  final String path;

  Mp3File({
    required this.id,
    required this.title,
    required this.path,
    this.artist,
  });

  factory Mp3File.fromMap(Map<String, dynamic> map) {
    return Mp3File(
      id: (map['id'] as num).toInt(),
      title: map['title'] ?? 'Unknown',
      artist: map['artist'],
      path: map['path'],
    );
  }
}