import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melonab/data/models/mp3_model.dart';


final mp3ControllerProvider =
    AsyncNotifierProvider<Mp3Controller, List<Mp3File>>(
  Mp3Controller.new,
);

class Mp3Controller extends AsyncNotifier<List<Mp3File>> {
  @override
  Future<List<Mp3File>> build() async {
    final files = await compute(_scanMp3Isolate, null);

    debugPrint('MP3 COUNT: ${files.length}');
    return files;
  }
}

Future<List<Mp3File>> _scanMp3Isolate(_) async {
  final roots = <String>[
    '/storage/emulated/0/Music',
    '/storage/emulated/0/Download',
  ];

  final result = <Mp3File>[];

  for (final path in roots) {
    final dir = Directory(path);

    if (!dir.existsSync()) continue;

    await for (final entity in dir.list(
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
  }

  return result;
}