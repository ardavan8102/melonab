import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/urls.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/core/utils/launch_url.dart';
import 'package:melonab/data/controllers/mp3_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/containers/home_big_banner.dart';
import 'package:melonab/presentation/widgets/containers/home_card_small.dart';
import 'package:melonab/presentation/widgets/song_artwork.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mp3State = ref.watch(mp3ControllerProvider);

    return Column(
      children: [
        // Small Cards
        SizedBox(
          height: AppDimens.mediumRowHeight,
          child: Row(
            spacing: AppDimens.marginLarge,
            children: [
              Expanded(
                child: HomeCardSmall(
                  bgColorList: AppGradientColor.homeScreenCardSmall1,
                  iconBottomRight: Assets.svg.dualMusicNote,
                  iconTopLeft: Assets.svg.musicNote,
                  label: 'جدیدترین',
                ),
              ),
              Expanded(
                child: HomeCardSmall(
                  bgColorList: AppGradientColor.homeScreenCardSmall2,
                  iconBottomRight: Assets.svg.heartMisBroke,
                  iconTopLeft: Assets.svg.dualMusicNote,
                  label: 'هنـرمنـدان',
                ),
              ),
            ],
          ),
        ),

        AppDimens.marginLarge.height,

        // Big Banner
        GestureDetector(
          onTap: () {
            directToUri(CustomURLS.googleFormUrl);
          },
          child: HomeBigBanner()
        ),

        AppDimens.largeSpacing.height,

        // Songs List
        Expanded(
          child: mp3State.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('خطا در بارگذاری: $e')),
            data: (files) {
              if (files.isEmpty) {
                return const Center(child: Text("آهنگی پیدا نشد"));
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 100), 
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    leading: SongArtworkWidget(songId: file.id),
                    title: Text(
                      file.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      file.artist ?? 'هنرمند ناشناس',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      // player code
                    },
                  );
                },
              );
            },
          ),
        ),

        AppDimens.largeSpacing.height,
      ],
    );
  }
}