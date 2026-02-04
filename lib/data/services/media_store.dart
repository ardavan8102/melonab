import 'package:flutter/services.dart';

class MediaStoreService {
  static const _channel = MethodChannel('media_store');

  static Future<List<Map<String, dynamic>>> getSongs() async {
    final List result = await _channel.invokeMethod('getSongs');
    return result
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  static Future<Uint8List?> getArt(int songId) async {
    try {
      final result = await _channel.invokeMethod('getArt', {'id': songId});
      return result as Uint8List?;
    } catch (e) {
      return null;
    }
  }
}