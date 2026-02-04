import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/mp3_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/containers/home_big_banner.dart';
import 'package:melonab/presentation/widgets/containers/home_card_small.dart';

class HomeGeneralTab extends ConsumerWidget {
  const HomeGeneralTab({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mp3State = ref.watch(mp3ControllerProvider);

    return Column(
      children: [
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
                )
              ),

              Expanded(
                child: HomeCardSmall(
                  bgColorList: AppGradientColor.homeScreenCardSmall2,
                  iconBottomRight: Assets.svg.heartMisBroke,
                  iconTopLeft: Assets.svg.dualMusicNote,
                  label: 'محبوب ترین',
                )
              ),
            ],
          ),
        ),

        AppDimens.marginLarge.height,

        // big banner
        HomeBigBanner(),

        AppDimens.largeSpacing.height,


        // Songs
        Expanded(
          child: mp3State.when(
            loading: () =>
              const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (files) => ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(file.name),
                  subtitle: Text(file.path),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}