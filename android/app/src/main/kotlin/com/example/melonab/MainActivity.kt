package com.melonab.app

import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(
      flutterEngine.dartExecutor.binaryMessenger,
      "media_store"
    ).setMethodCallHandler { call, result ->

      if (call.method == "getSongs") {
        val songs = mutableListOf<Map<String, Any?>>()

        val projection = arrayOf(
          MediaStore.Audio.Media.TITLE,
          MediaStore.Audio.Media.ARTIST,
          MediaStore.Audio.Media.DATA
        )

        val cursor = contentResolver.query(
          MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
          projection,
          "${MediaStore.Audio.Media.IS_MUSIC}=1",
          null,
          null
        )

        cursor?.use {
          val titleCol =
            it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
          val artistCol =
            it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
          val pathCol =
            it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)

          while (it.moveToNext()) {
            songs.add(
              mapOf(
                "title" to it.getString(titleCol),
                "artist" to it.getString(artistCol),
                "path" to it.getString(pathCol)
              )
            )
          }
        }

        result.success(songs)
      } else {
        result.notImplemented()
      }
    }
  }
}