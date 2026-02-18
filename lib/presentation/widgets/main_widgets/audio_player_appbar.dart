import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/extensions/sized_box.dart';
import 'package:melonab/presentation/view/player/audio_player.dart';

class AudioPlayerAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AudioPlayerAppBarWidget({
    super.key,
    required this.widget,
  });

  final AudioPlayerScreen widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(widget.songName),
      centerTitle: true,
      leading: Row(
        children: [
          AppDimens.paddingLarge.width,
    
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios
            ),
            onTap: () => Get.back(),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          child: Icon(
            CupertinoIcons.bars
          ),
          onTap: () {},
        ),
    
        AppDimens.paddingLarge.width,
      ],
    );
  }
  
  @override
  Size get preferredSize => Size(Get.width, 60);
}