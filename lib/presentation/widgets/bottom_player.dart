import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/view/player/player_screen.dart';
import 'package:melonab/presentation/widgets/buttons/filled_elevated_button.dart';

class BottomPlayer extends StatelessWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = AudioController();

    return ValueListenableBuilder(
      valueListenable: audioController.currentIndex,
      builder: (context, currentIndex, _) {
        final currentSong = audioController.currentSong;
        if(currentSong == null) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () {
            Get.to(PlayerScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppSolidColors.primary.withAlpha(100),
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.mediumRadius)),
              boxShadow: [
                BoxShadow(
                  color: AppSolidColors.primary,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(-5, -5)
                ),

                BoxShadow(
                  color: AppSolidColors.primary,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(5, 5)
                ),
              ],
            ),
            child: Column(
              mainAxisSize: .min,
              children: [
                // Song Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium, vertical: AppDimens.paddingSmall),
                  child: SizedBox(
                    height: 20,
                    child: Marquee(
                      text: currentSong.title.toString().split('/').last,
                      blankSpace: 50,
                      startPadding: 30,
                      velocity: 10,
                    ),
                  ),
                ),

                // Progress Bar
                StreamBuilder<Duration>(
                  stream: audioController.audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final duration = audioController.audioPlayer.duration ?? Duration.zero;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
                      child: ProgressBar(
                        progress: position,
                        total: duration,
                        progressBarColor: AppSolidColors.accent.withValues(alpha: .7),
                        baseBarColor: AppSolidColors.accent.withValues(alpha: .2),
                        thumbColor: AppSolidColors.accent,
                        bufferedBarColor: Colors.red,
                        barHeight: 3,
                        thumbRadius: AppDimens.smallRadius,
                        timeLabelLocation: .none,
                        onSeek: (duration) {
                          audioController.audioPlayer.seek(duration);
                        },
                      ),
                    );
                  },
                ),

                Row(
                  children: [
                    SizedBox(
                      child: Lottie.asset(
                        height: 60,
                        width: 60,
                        fit: .cover,
                        Assets.animations.loading
                      ),
                    ),

                    AppDimens.marginMedium.width,

                    Expanded(child: SizedBox()),

                    Row(
                      children: [
                        FilledCustomButton(
                          onPress: audioController.previousSong,
                          child: Icon(
                            Icons.skip_previous_rounded,
                          ),
                        ),

                        AppDimens.marginMedium.width,

                        StreamBuilder<PlayerState>(
                          stream: audioController.audioPlayer.playerStateStream,
                          builder: (context, snapshot) {
                            final playerState = snapshot.data;
                            final processingState = playerState?.processingState;
                            final playing = playerState?.playing;

                            if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {

                              return Container(
                                margin: const EdgeInsets.all(AppDimens.marginSmall),
                                width: 32,
                                height: 32,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(AppSolidColors.primary),
                                ),
                              );
                            }

                            return FilledCustomButton(
                              onPress: () {},
                              child: Icon(
                                playing == true ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                color: playing == true ? AppSolidColors.primary : AppSolidColors.primary.withValues(alpha: .5),
                              ),
                            );
                          },
                        ),

                        AppDimens.marginMedium.width,

                        // Skip to Next
                        FilledCustomButton(
                          onPress: audioController.nextSong,
                          child: Icon(
                            Icons.skip_next_rounded,
                          ),
                        ),

                        // Skip to previous
                        FilledCustomButton(
                          onPress: audioController.previousSong,
                          child: Icon(
                            Icons.skip_previous_rounded,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}