import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/data/models/local_song.dart';
import 'package:melonab/gen/assets.gen.dart';

class BuildArtwork extends StatelessWidget {
  const BuildArtwork({
    super.key,
    required this.audioController,
    required this.song,
  });

  final AudioController audioController;
  final LocalSongModel song;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: audioController.getArtwork(song),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(AppDimens.smallRadius),
            child: Image.memory(
              song.thumbnail!,
              width: AppDimens.songListItemArtWorkSize,
              height: AppDimens.songListItemArtWorkSize,
              fit: BoxFit.cover,
            ),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(AppDimens.smallRadius),
          child: Image.asset(
            Assets.img.melonabLogo.path,
            width: AppDimens.songListItemArtWorkSize,
            height: AppDimens.songListItemArtWorkSize,
          ),
        );
      },
    );
  }
}