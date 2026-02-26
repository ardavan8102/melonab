import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';


Future<Uri> saveArtworkToFile({
  required Uint8List bytes,
  required int songId,
}) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/artwork_$songId.jpg');

  if (!await file.exists()) {
    await file.writeAsBytes(bytes, flush: true);
  }

  return file.uri;
}
