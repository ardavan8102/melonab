import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melonab/data/models/mp3_model.dart';
import 'package:melonab/data/services/media_store.dart';

final mp3ControllerProvider =
    AsyncNotifierProvider<Mp3Controller, List<Mp3File>>(
  Mp3Controller.new,
);

class Mp3Controller extends AsyncNotifier<List<Mp3File>> {
  @override
  Future<List<Mp3File>> build() async {

    final songs = await MediaStoreService.getSongs();

    final mp3s = songs.map((e) {
      return Mp3File(
        name: e['title'] ?? 'Unknown',
        artist: e['artist'],
        path: e['path'],
      );
    }).toList();

    debugPrint('MP3 COUNT: ${mp3s.length}');
    return mp3s;
  }
}