import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/build_artwork.dart';
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
    return ValueListenableBuilder(
      valueListenable: audioController.songs,
      builder: (context, songs, child) {
        if (songs.isEmpty) {
          return LoadingCircle();
        }
    
        return Column(
          children: [
            AppDimens.marginLarge.height,
    
            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
              child: Row(
                children: [
                  Text(
                    '${songs.length} آهنگ یافت شد'
                  ),
    
                  Spacer(),
    
                  SizedBox(
                    height: AppDimens.iconSizeMedium,
                    width: AppDimens.iconSizeMedium,
                    child: SvgPicture.asset(
                      Assets.svg.sort,
                      fit: .cover,
                      colorFilter: ColorFilter.mode(AppSolidColors.primaryIcon, BlendMode.srcIn),
                    ),
                  ),
    
                  AppDimens.marginLarge.width,
    
                  SizedBox(
                    height: AppDimens.iconSizeMedium,
                    width: AppDimens.iconSizeMedium,
                    child: SvgPicture.asset(
                      colorFilter: ColorFilter.mode(AppSolidColors.primaryIcon, BlendMode.srcIn),
                      Assets.svg.checklist,
                      fit: .cover,
                    ),
                  ),
                ],
              ),
            ),
    
            AppDimens.marginSmall.height,
    
            // Songs
            Flexible(
              child: ListView.builder(
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
                              padding: EdgeInsets.all(AppDimens.paddingMedium),
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
                                  BuildArtwork(
                                    song: song,
                                    audioController: audioController,
                                  ),
              
                                  AppDimens.marginMedium.width,
                            
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
              
                                  AppDimens.marginMedium.width,
                            
                                  // Play button
                                  FilledCustomButton(
                                    onPress: () => audioController.playSong(index),
                                    backgroundColor: isCurrentSong && isPlaying
                                      ? AppSolidColors.primary
                                      : AppSolidColors.primary.withValues(alpha: .4),
                                    child: isCurrentSong && isPlaying
                                      ? Lottie.asset(
                                          Assets.animations.musicVolumeWhite,
                                          width: AppDimens.iconSizeMedium
                                        )
                                      : Icon(
                                          Icons.play_arrow_rounded,
                                          size: AppDimens.iconSizeMedium,
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
              ),
            ),
          ],
        );
      },
    );
  }
}