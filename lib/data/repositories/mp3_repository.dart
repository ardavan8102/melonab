import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:melonab/core/utils/file_scanner.dart';
import 'package:melonab/data/models/mp3_model.dart';
import 'package:path_provider/path_provider.dart';


class Mp3Repository {
  Future<List<Mp3File>> scanAllMp3Files() async {
    debugPrint('scanAllMp3Files CALLED');

    final result = <Mp3File>[];

    final roots = await getExternalStorageDirectories();
    debugPrint('External roots: ${roots?.map((e) => e.path).toList()}');

    if (roots == null) return result;

    for (final root in roots) {
      final paths = await compute(scanMp3FilesIsolate, root.path);

      for (final path in paths) {
        result.add(Mp3File.fromFile(File(path.toString())));
      }
    }

    return result;
  }
}