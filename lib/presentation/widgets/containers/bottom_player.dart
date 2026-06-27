import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marquee/marquee.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
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
            // Go to Player Screen
            //Get.to(PlayerScreen());
          },
          child: Container( // bottom shadow Overylad
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppGradientColor.primaryFadeGradient,
                begin: .bottomCenter,
                end: .topCenter,
              )
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppDimens.paddingMedium, bottom: AppDimens.paddingMedium),
                    child: Column(
                      children: [
                        
                        // Skip to Next
                        FilledCustomButton(
                          padding: EdgeInsets.all(12),
                          onPress: audioController.nextSong,
                          child: Icon(
                            Icons.skip_next_rounded,
                          ),
                        ),
                        
                        AppDimens.marginSmall.height,
                        
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
                              padding: EdgeInsets.all(12),
                              onPress: () => audioController.playSong(currentIndex),
                              child: Icon(
                                playing == true ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                color: AppSolidColors.primaryIcon,
                              ),
                            );
                          },
                        ),
                        
                        AppDimens.marginSmall.height,
                        
                        // Skip to previous
                        FilledCustomButton(
                          padding: EdgeInsets.all(12),
                          onPress: audioController.previousSong,
                          child: Icon(
                            Icons.skip_previous_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(AppDimens.paddingMedium, 0, AppDimens.paddingMedium, AppDimens.paddingMedium),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                        border: Border.all(
                          width: 1,
                          color: Colors.white.withValues(alpha: .4)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppSolidColors.primary.withValues(alpha: .3),
                            blurRadius: 30,
                            spreadRadius: 1,
                            offset: Offset(-5, -5)
                          ),
                    
                          BoxShadow(
                            color: AppSolidColors.primary.withValues(alpha: .2),
                            blurRadius: 30,
                            spreadRadius: 1,
                            offset: Offset(5, 5)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.paddingMedium),
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                // Song Title
                                SizedBox(
                                  height: 30,
                                  child: Marquee(
                                    text: 
                                      'آهنگ : ${currentSong.title.toString().split('/').last} | هنرمند : ${currentSong.artist}',
                                    blankSpace: AppDimens.marginLarge,
                                    startPadding: 30,
                                    velocity: 10,
                                    fadingEdgeEndFraction: .3,
                                    fadingEdgeStartFraction: .3,
                                  ),
                                ),
                                
                                AppDimens.marginMedium.height,

                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  spacing: AppDimens.marginSmall,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        currentSong.artist,
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                          color: AppSolidColors.primaryText.withValues(alpha: .8)
                                        ),
                                        maxLines: 1,
                                        overflow: .ellipsis,
                                      ),
                                    ),

                                    Expanded(
                                      child: Text(
                                        textAlign: .left,
                                        'آلبوم ${currentSong.albumTitle}',
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: AppSolidColors.primaryText.withValues(alpha: .4)
                                        ),
                                        maxLines: 1,
                                        overflow: .ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                                Spacer(),
                    
                                // Progress Bar
                                StreamBuilder<Duration>(
                                  stream: audioController.audioPlayer.positionStream,
                                  builder: (context, snapshot) {
                                    final position = snapshot.data ?? Duration.zero;
                                    final duration = audioController.audioPlayer.duration ?? Duration.zero;
                                        
                                    return ProgressBar(
                                      progress: position,
                                      total: duration,
                                      progressBarColor: AppSolidColors.musicProgressBar.withValues(alpha: .5),
                                      baseBarColor: AppSolidColors.musicProgressBar.withValues(alpha: .2),
                                      thumbColor: AppSolidColors.musicProgressBar,
                                      bufferedBarColor: Colors.red,
                                      barHeight: 3,
                                      thumbRadius: AppDimens.smallRadius,
                                      timeLabelLocation: .none,
                                      onSeek: (duration) {
                                        audioController.audioPlayer.seek(duration);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}