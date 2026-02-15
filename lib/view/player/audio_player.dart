import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String img = 'https://assets.rjassets.com/static/playlist/2388276/0ee09cd71aac48b-thumb.jpg';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Song Name'),
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
      ),
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
                      image: NetworkImage(
                        img,
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
                  imageUrl: img,
                  width: Get.width * .6,
                  height: Get.width * .6,
                  fit: .cover,
                ),
              ),

              AppDimens.mediumSpacing.height,

              Text(
                'Vaghteshe Beri',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              Text(
                'Ashvan',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppSolidColors.primaryText.withValues(alpha: .7)
                ),
              ),

              AppDimens.largeSpacing.height,

              AppDimens.largeSpacing.height
            ],
          ),
        ],
      ),
    );
  }
}