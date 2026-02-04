import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class StoragePermission {
  static Future<bool> request() async {
    if (!Platform.isAndroid) return true;

    final status = await Permission.audio.request();
    return status.isGranted;
  }
}