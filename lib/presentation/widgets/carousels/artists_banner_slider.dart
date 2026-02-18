import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/models/artist_model.dart';
import 'package:melonab/presentation/widgets/containers/dark_overlay.dart';

class ArtistsBannerSlider extends StatelessWidget {
  const ArtistsBannerSlider({
    super.key,
    required this.artists,
  });

  final RxList<ArtistModel> artists;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return CarouselSlider(
      items: artists.map((artist) {
        return Container(
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                artist.photo,
              ),
              alignment: .topCenter,
              fit: .cover
            ),
            borderRadius: BorderRadius.circular(AppDimens.mediumRadius)
          ),
          child: Stack(
            children: [
              // Overlay
              DarkOverlayGradient(),
            
              // name
              Positioned(
                left: AppDimens.paddingMedium,
                right: AppDimens.paddingMedium,
                bottom: AppDimens.paddingMedium,
                child: Column(
                  children: [
                    Text(
                      artist.name,
                      style: textTheme.labelLarge,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                
                    Text(
                      artist.itemSubtitle,
                      style: textTheme.labelSmall!.copyWith(
                        color: AppSolidColors.primaryText.withValues(alpha: .5),
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
      ),
    );
  }
}