import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:melonab/presentation/view_model/audio_player_viewmodel.dart';
import 'package:melonab/presentation/widgets/main_widgets/play_pause_button.dart';

class AudioPlayerControllsRow extends StatelessWidget {
  const AudioPlayerControllsRow({
    super.key,
    required this.audioPlayerViewModel,
    required AudioPlayer player,
  }) : _player = player;

  final AudioPlayerViewmodel audioPlayerViewModel;
  final AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        // forward
        IconButton(
          onPressed: () => audioPlayerViewModel.seekBy(const Duration(seconds: 10), _player),
          icon: Icon(Icons.forward_10_outlined),
          iconSize: 40,
        ),
    
        // play
        PlayPauseButtonWidget(player: _player),
    
        // Backward
        IconButton(
          onPressed: () => audioPlayerViewModel.seekBy(const Duration(seconds: -10), _player),
          icon: Icon(Icons.replay_10_outlined),
          iconSize: 40,
        ),
      ],
    );
  }
}