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

  /// File path: assets/icons/email.svg
  String get email => 'assets/icons/email.svg';

  /// File path: assets/icons/eyes_off.svg
  String get eyesOff => 'assets/icons/eyes_off.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/name.svg
  String get name => 'assets/icons/name.svg';

  /// File path: assets/icons/password.svg
  String get password => 'assets/icons/password.svg';

  /// File path: assets/icons/phone.svg
  String get phone => 'assets/icons/phone.svg';

  /// List of all assets
  List<String> get values => [email, eyesOff, google, name, password, phone];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ar.png
  AssetGenImage get ar => const AssetGenImage('assets/images/ar.png');

  /// File path: assets/images/en.png
  AssetGenImage get en => const AssetGenImage('assets/images/en.png');

  /// File path: assets/images/movie1.png
  AssetGenImage get movie1 => const AssetGenImage('assets/images/movie1.png');

  /// File path: assets/images/movie2.png
  AssetGenImage get movie2 => const AssetGenImage('assets/images/movie2.png');

  /// File path: assets/images/movie3.png
  AssetGenImage get movie3 => const AssetGenImage('assets/images/movie3.png');

  /// File path: assets/images/movie4.png
  AssetGenImage get movie4 => const AssetGenImage('assets/images/movie4.png');

  /// File path: assets/images/movie5.png
  AssetGenImage get movie5 => const AssetGenImage('assets/images/movie5.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    ar,
    en,
    movie1,
    movie2,
    movie3,
    movie4,
    movie5,
  ];
}

class $AssetsPostersGen {
  const $AssetsPostersGen();

  /// File path: assets/posters/Movies Posters.png
  AssetGenImage get moviesPosters =>
      const AssetGenImage('assets/posters/Movies Posters.png');

  /// List of all assets
  List<AssetGenImage> get values => [moviesPosters];
}

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/splash_branding.png
  AssetGenImage get splashBranding =>
      const AssetGenImage('assets/splash/splash_branding.png');

  /// File path: assets/splash/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/splash/splash_logo.png');

  /// File path: assets/splash/splash_logo_android12.png
  AssetGenImage get splashLogoAndroid12 =>
      const AssetGenImage('assets/splash/splash_logo_android12.png');

  /// File path: assets/splash/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/splash/splash_screen.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    splashBranding,
    splashLogo,
    splashLogoAndroid12,
    splashScreen,
  ];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsPostersGen posters = $AssetsPostersGen();
  static const $AssetsSplashGen splash = $AssetsSplashGen();
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
