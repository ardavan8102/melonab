import 'dart:io';

class Mp3File {
  final String path;
  final String name;
  final int? size;
  final DateTime? lastModified;

  Mp3File({
    required this.path,
    required this.name,
    this.size,
    this.lastModified,
  });

  factory Mp3File.fromFile(File file) {
    return Mp3File(
      path: file.path,
      name: file.path.split('/').last,
      size: file.lengthSync(),
      lastModified: file.lastModifiedSync(),
    );
  }
}