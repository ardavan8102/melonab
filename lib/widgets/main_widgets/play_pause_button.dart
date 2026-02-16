import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayPauseButtonWidget extends StatelessWidget {
  const PlayPauseButtonWidget({
    super.key,
    required AudioPlayer player,
  }) : _player = player;

  final AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
    
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: _player.play,
            iconSize: 80,
            color: Colors.white,
            icon: const Icon(Icons.play_arrow_rounded),
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: _player.pause,
            iconSize: 80,
            color: Colors.white,
            icon: const Icon(Icons.pause_rounded),
          );
        }
        return Icon(
          Icons.pause_rounded,
          size: 80,
          color: Colors.white,
        );
      },
    );
  }
}