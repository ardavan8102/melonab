import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/buttons/filled_elevated_button.dart';
import 'package:melonab/presentation/widgets/loading_circle.dart';

class SongsTabView extends StatefulWidget {
  const SongsTabView({super.key});

  @override
  State<SongsTabView> createState() => _SongsTabViewState();
}

class _SongsTabViewState extends State<SongsTabView> {

  final audioController = AudioController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: audioController.songs,
        builder: (context, songs, child) {
          if (songs.isEmpty) {
            return LoadingCircle();
          }

          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];

              return ValueListenableBuilder(
                valueListenable: audioController.currentIndex,
                builder: (context, currentIndex, child) {
                  return ValueListenableBuilder(
                    valueListenable: audioController.isPlaying,
                    builder: (context, isPlaying, child) {
                      final isCurrentSong = currentIndex == index;
                      
                      return GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: index == songs.length - 1 
                                ? BorderSide(width: 0)
                                : BorderSide(
                                  width: 1,
                                  color: AppSolidColors.dividerColor.withValues(alpha: .1)
                                )
                            ),
                          ),
                          child: Row(
                            children: [
                              // Art
                              Image.asset(
                                Assets.img.melonabLogo.path,
                                width: AppDimens.songListItemArtWorkSize,
                                height: AppDimens.songListItemArtWorkSize,
                              ),

                              AppDimens.marginSmall.width,
                        
                              // Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      song.title,
                                      maxLines: 1,
                                      overflow: .ellipsis,
                                    ),
                                                        
                                    Text(
                                      song.artist,
                                      maxLines: 1,
                                      overflow: .ellipsis,
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    
                                    AppDimens.marginSmall.width,
                                  ],
                                ),
                              ),
                        
                              // Play button
                              FilledCustomButton(
                                onPress: () => audioController.playSong(index),
                                backgroundColor: isCurrentSong && isPlaying
                                  ? AppSolidColors.primary
                                  : AppSolidColors.primary.withValues(alpha: .4),
                                child: Icon(
                                  isCurrentSong && isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}