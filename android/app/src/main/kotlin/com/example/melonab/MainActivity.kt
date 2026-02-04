package com.melonab.app

import android.content.ContentUris
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.util.Size
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "media_store"
        ).setMethodCallHandler { call, result ->

            // متد دریافت لیست آهنگ‌ها
            if (call.method == "getSongs") {
                val songs = mutableListOf<Map<String, Any?>>()

                val projection = arrayOf(
                    MediaStore.Audio.Media._ID, // اضافه کردن ID
                    MediaStore.Audio.Media.TITLE,
                    MediaStore.Audio.Media.ARTIST,
                    MediaStore.Audio.Media.DATA,
                )

                val cursor = contentResolver.query(
                    MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                    projection,
                    "${MediaStore.Audio.Media.IS_MUSIC}=1",
                    null,
                    null
                )

                cursor?.use {
                    val idCol = it.getColumnIndexOrThrow(MediaStore.Audio.Media._ID)
                    val titleCol = it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
                    val artistCol = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
                    val pathCol = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)

                    while (it.moveToNext()) {
                        songs.add(
                            mapOf(
                                "id" to it.getLong(idCol), // ارسال ID به فلاتر
                                "title" to it.getString(titleCol),
                                "artist" to it.getString(artistCol),
                                "path" to it.getString(pathCol)
                            )
                        )
                    }
                }
                result.success(songs)
            } 
            // متد جدید برای دریافت عکس کاور
            else if (call.method == "getArt") {
                // دریافت آرگومان‌ها به صورت امن
                val args = call.arguments as? Map<String, Any>
                val songId = (args?.get("id") as? Number)?.toLong()

                if (songId == null) {
                    result.error("INVALID_ID", "Song ID is null", null)
                    return@setMethodCallHandler
                }

                val artBytes = getAlbumArt(songId)
                result.success(artBytes)
            } else {
                result.notImplemented()
            }
        }
    }

    // تابع کمکی برای استخراج تصویر
    private fun getAlbumArt(songId: Long): ByteArray? {
        var bitmap: Bitmap? = null
        try {
            val contentUri = ContentUris.withAppendedId(
                MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                songId
            )

            bitmap = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                // برای اندروید 10 و بالاتر
                try {
                    contentResolver.loadThumbnail(contentUri, Size(200, 200), null)
                } catch (e: Exception) {
                    null
                }
            } else {
                // برای اندرویدهای قدیمی‌تر
                try {
                    val sArtworkUri = Uri.parse("content://media/external/audio/albumart")
                    val albumArtUri = ContentUris.withAppendedId(sArtworkUri, songId) 
                    null
                } catch (e: Exception) {
                    null
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }

        return if (bitmap != null) {
            val stream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.toByteArray()
        } else {
            null
        }
    }
}