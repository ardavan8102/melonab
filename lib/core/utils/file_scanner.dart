import 'dart:io';
import 'package:melonab/data/models/mp3_model.dart';

Future<List<Mp3File>> scanMp3FilesIsolate(_) async {
  final rootDir = Directory('/storage/emulated/0');

  if (!rootDir.existsSync()) return [];

  final result = <Mp3File>[];

  await for (final entity in rootDir.list(
    recursive: true,
    followLinks: false,
  )) {
    if (entity is File &&
        entity.path.toLowerCase().endsWith('.mp3')) {
      result.add(
        Mp3File(
          name: entity.uri.pathSegments.last,
          path: entity.path,
        ),
      );
    }
  }

  return result;
}