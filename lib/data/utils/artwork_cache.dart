import 'package:melonab/data/models/local_song.dart';
import 'package:melonab/data/utils/save_file_artwork.dart';

class ArtworkCache {
  static final _cache = <int, Uri>{};

  static Future<Uri?> getArtwork(LocalSongModel song) async {
    // if thumbnail cached
    if (_cache.containsKey(song.id)) {
      return _cache[song.id];
    }

    // if thumbnail not loaded
    if (song.thumbnail == null || song.thumbnail!.isEmpty) {
      return null;
    }

    // saving
    final uri = await saveArtworkToFile(
      bytes: song.thumbnail!,
      songId: song.id,
    );

    _cache[song.id] = uri;
    return uri;
  }
}