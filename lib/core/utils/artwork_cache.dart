// یک حافظه موقت ساده برای نگهداری عکس‌ها بر اساس شناسه آهنگ
import 'dart:typed_data';

class ArtworkCache {
  static final Map<int, Uint8List> _cache = {};

  static Uint8List? get(int id) => _cache[id];

  static void set(int id, Uint8List bytes) {
    if (_cache.length > 1000) {
      _cache.remove(_cache.keys.first);
    }
    _cache[id] = bytes;
  }
  
  static bool has(int id) => _cache.containsKey(id);
}