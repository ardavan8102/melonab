// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/Menu.png');

  /// File path: assets/icons/album.png
  AssetGenImage get album => const AssetGenImage('assets/icons/album.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/music.png
  AssetGenImage get music => const AssetGenImage('assets/icons/music.png');

  /// File path: assets/icons/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/icons/podcast.png');

  /// File path: assets/icons/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/icons/settings.png');

  /// File path: assets/icons/share.png
  AssetGenImage get share => const AssetGenImage('assets/icons/share.png');

  /// File path: assets/icons/submit_nazar.png
  AssetGenImage get submitNazar =>
      const AssetGenImage('assets/icons/submit_nazar.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    menu,
    album,
    home,
    music,
    podcast,
    settings,
    share,
    submitNazar,
  ];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/melonab_logo.png
  AssetGenImage get melonabLogo =>
      const AssetGenImage('assets/img/melonab_logo.png');

  /// File path: assets/img/transparent_logo.png
  AssetGenImage get transparentLogo =>
      const AssetGenImage('assets/img/transparent_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [melonabLogo, transparentLogo];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/home_items.json
  String get homeItems => 'assets/json/home_items.json';

  /// List of all assets
  List<String> get values => [homeItems];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Menu.svg
  String get menu => 'assets/svg/Menu.svg';

  /// File path: assets/svg/dual_music_note.svg
  String get dualMusicNote => 'assets/svg/dual_music_note.svg';

  /// File path: assets/svg/heart_mis_broke.svg
  String get heartMisBroke => 'assets/svg/heart_mis_broke.svg';

  /// File path: assets/svg/music_note.svg
  String get musicNote => 'assets/svg/music_note.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// List of all assets
  List<String> get values => [
    menu,
    dualMusicNote,
    heartMisBroke,
    musicNote,
    search,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
