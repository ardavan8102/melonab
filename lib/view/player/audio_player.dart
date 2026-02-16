import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/audio_player_viewmodel.dart';
import 'package:melonab/widgets/main_widgets/audio_player_appbar.dart';
import 'package:melonab/widgets/main_widgets/audio_progress_bar.dart';
import 'package:melonab/widgets/rows/audio_player_controlls.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.photoUrl,
    required this.audioUrl,
    required this.artistName,
    required this.songName
  });

  final String photoUrl;
  final String audioUrl;
  final String artistName;
  final String songName;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioPlayerViewModel = Get.put(AudioPlayerViewmodel());
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = audioPlayerViewModel.player;
    _initializePlayer();
    _player.setLoopMode(LoopMode.one);
  }
  
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    try {
      final audioSource = AudioSource.uri(
        Uri.parse(widget.audioUrl),
        tag: MediaItem(
          id: widget.audioUrl,
          title: widget.songName,
          artist: widget.artistName,
          artUri: Uri.parse(widget.photoUrl),
        ),
      );

      await _player.setAudioSource(audioSource);
    } catch (e, stack) {
      debugPrint('Player init failed: $e');
      debugPrintStack(stackTrace: stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AudioPlayerAppBarWidget(widget: widget),
      body: Stack(
        alignment: .center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
                stops: [0.0, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        widget.photoUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 8,
                      sigmaY: 8,
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // content
          Column(
            spacing: 0,
            mainAxisAlignment: .center,
            children: [
              // text
              Text(
                'Melonab | Your life on the beat',
                style: TextStyle(
                  fontSize: 14,
                  color: AppSolidColors.primaryText.withValues(alpha: .7)
                ),
              ),

              AppDimens.smallSpacing.height,

              // thumbnail
              ClipRRect(
                borderRadius: .circular(AppDimens.mediumRadius),
                child: CachedNetworkImage(
                  imageUrl: widget.photoUrl,
                  width: Get.width * .6,
                  height: Get.width * .6,
                  fit: .cover,
                ),
              ),

              AppDimens.mediumSpacing.height,

              Text(
                widget.songName,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              Text(
                widget.artistName,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppSolidColors.primaryText.withValues(alpha: .7)
                ),
              ),

              AppDimens.largeSpacing.height,

              AudioProgressBarWidget(stream: audioPlayerViewModel.positionDataStream, player: _player),

              AppDimens.largeSpacing.height,

              AudioPlayerControllsRow(audioPlayerViewModel: audioPlayerViewModel, player: _player),

              AppDimens.largeSpacing.height
            ],
          ),
        ],
      ),
    );
  }
}