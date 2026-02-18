import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/presentation/view_model/audio_player_viewmodel.dart';

class AudioProgressBarWidget extends StatelessWidget {
  const AudioProgressBarWidget({
    super.key,
    required AudioPlayer player,
    required this.stream,
  }) : _player = player;

  final AudioPlayer _player;
  final Stream<PositionData> stream;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: StreamBuilder<PositionData>(
        stream: stream,
        builder: (context, snapshot) {
          final positionData = snapshot.data;
          return ProgressBar(
            barHeight: 8,
            baseBarColor: Colors.grey[600],
            bufferedBarColor: Colors.grey,
            progressBarColor: AppSolidColors.primary,
            thumbColor: AppSolidColors.secondary,
            timeLabelTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: .w600,
              fontSize: 14
            ),
            timeLabelPadding: 12,
            thumbGlowColor: AppSolidColors.accent,
            progress: positionData?.position ?? Duration.zero,
            total: positionData?.duration ?? Duration.zero,
            buffered: positionData?.bufferedPosition ?? Duration.zero,
            onSeek: _player.seek,
          );
        },
      ),
    );
  }
}